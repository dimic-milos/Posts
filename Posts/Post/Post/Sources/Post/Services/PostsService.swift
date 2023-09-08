//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

import Foundation
import Resolver
import Network
import Models

protocol PostsServiceProtocol {

    func fetchPosts(userID: Int) async throws -> [PostAPIModel]
}

final class PostsService {

    // MARK: - Private properties

    @Injected private var network: NetworkServiceProtocol
}

extension PostsService: PostsServiceProtocol {

    func fetchPosts(userID: Int) async throws -> [PostAPIModel] {
        let model = PostAPIRequestModel(userID: userID)
        let request = NetworkServiceRequest(
            path: .posts,
            method: .get,
            parameters: model.parameters()
        )

        return try await self.network.execute(
            request: request,
            type: [PostAPIModel].self
        )
    }
}
