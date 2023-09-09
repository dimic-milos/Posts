//
//  File.swift
//  
//
//  Created by Milos Dimic on 09.09.23.
//

import Foundation
import Resolver
import Models

protocol CommentsManagerProtocol {

    func fetchComments(postID: Int) async throws -> [CommentModel]
}

final class CommentsManager {

    // MARK: - Private properties

    @Injected private var service: CommentsServiceProtocol
}

// MARK: - CommentsManagerProtocol

extension CommentsManager: CommentsManagerProtocol {

    func fetchComments(postID: Int) async throws -> [CommentModel] {
        try await self.service.fetchComments(postID: postID)
            .map { try $0.asPresentationModel }
    }
}
