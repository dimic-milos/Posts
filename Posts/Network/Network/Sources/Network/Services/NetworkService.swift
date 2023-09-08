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

final class NetworkService {

    // MARK: - Private properties

    @Injected private var client: NetworkClientProtocol
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
        do {
            let (data, response) = try await self.client.request(request)
            if self.isSuccess(response, for: request) {
                do {
                    return try self.decoder.decode(type, from: data)
                } catch {
                    throw CustomError.decodingFailed(error: error)
                }
            } else {
                throw CustomError.statusCodeNotInSuccessRange
            }
        } catch {
            throw error
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

        case statusCodeNotInSuccessRange
        case decodingFailed(error: Error)
    }
}
