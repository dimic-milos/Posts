//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

import Foundation
import Resolver
import Models

protocol PostsManagerProtocol {

    func fetchPosts(userID: Int) async throws -> [PostModel]
    func fetchFavouritePosts() -> [PostModel]
}

final class PostsManager {

    // MARK: - Private properties

    @Injected private var service: PostsServiceProtocol
}

// MARK: - PostsManagerProtocol

extension PostsManager: PostsManagerProtocol {

    func fetchPosts(userID: Int) async throws -> [PostModel] {
        try await self.service.fetchPosts(userID: userID)
            .map { try $0.asPresentationModel }
    }

    func fetchFavouritePosts() -> [PostModel] {
        []
    }
}
