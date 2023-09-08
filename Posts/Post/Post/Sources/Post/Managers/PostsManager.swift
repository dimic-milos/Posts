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
    func fetchFavourites(ids: [Int]?) async throws -> [PostModel]
    func updateFavourite(model: PostModel) async throws
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

    func fetchFavourites(ids: [Int]?) async throws -> [PostModel] {
        try await self.service.fetchFavourites(ids: ids)
            .map { try $0.asPresentationModel }
    }

    func updateFavourite(model: PostModel) async throws {
        let id = model.id
        let isFavourite = try await !self.service.fetchFavourites(ids: [id]).isEmpty
        
        if isFavourite {
            try await self.service.delete(id: id)
        } else {
            try await self.service.save(model: model.asDatabaseModel)
        }
    }
}
