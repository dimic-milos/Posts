//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

import Foundation
import Resolver

public protocol NetworkServiceProtocol {

    func execute<T: Decodable>(
        request: NetworkServiceRequest,
        type: T.Type
    ) async throws -> T
}

actor NetworkService {

    // MARK: - Private properties

    @Injected private var client: NetworkClientProtocol
    
    private var tasks: [NetworkServiceRequest: Task<Decodable, Error>] = [:]
    private let decoder = JSONDecoder()

    // MARK: - Init

    init() {}
}

// MARK: - NetworkServiceProtocol

extension NetworkService: NetworkServiceProtocol {

    public func execute<T: Decodable>(
        request: NetworkServiceRequest,
        type: T.Type
    ) async throws -> T {
        if let task = self.tasks[request], let value = try await task.value as? T {
            return value
        }

        let task = Task<Decodable, Error> {
            do {
                let (data, response) = try await self.client.request(request)
                if self.isSuccess(response, for: request) {
                    do {
                        let item = try self.decoder.decode(type, from: data)
                        self.tasks[request] = nil
                        return item
                    } catch {
                        throw CustomError.decodingFailed(error: error)
                    }
                } else {
                    throw CustomError.statusCodeNotInSuccessRange
                }
            } catch {
                self.tasks[request] = nil
                throw error
            }
        }
        self.tasks[request] = task

        if let value = try await task.value as? T {
            return value
        } else {
            throw CustomError.castFail
        }
    }

    // MARK: - Helpers

    private func isSuccess(
        _ urlResponse: URLResponse,
        for request: NetworkServiceRequest
    ) -> Bool {
        if
            let response = urlResponse as? HTTPURLResponse,
            request.path.successStatusCodeRange.contains(response.statusCode)
        {
            return true
        } else {
            return false
        }
    }
}

extension NetworkService {

    enum CustomError: Error {

        case castFail
        case statusCodeNotInSuccessRange
        case decodingFailed(error: Error)
    }
}
