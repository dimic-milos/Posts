//
//  File.swift
//  
//
//  Created by Milos Dimic on 09.09.23.
//

import Foundation
import Resolver
import Network
import Models

protocol CommentsServiceProtocol {

    func fetchComments(postID: Int) async throws -> [CommentAPIModel]
}

final class CommentsService {

    // MARK: - Private properties

    @Injected private var network: NetworkServiceProtocol
}

// MARK: - CommentsServiceProtocol

extension CommentsService: CommentsServiceProtocol {

    func fetchComments(postID: Int) async throws -> [CommentAPIModel] {
        let request = NetworkServiceRequest(
            path: .comments(postID: postID),
            method: .get
        )

        return try await self.network.execute(
            request: request,
            type: [CommentAPIModel].self
        )
    }
}
