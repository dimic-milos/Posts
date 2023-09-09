//
//  File.swift
//  
//
//  Created by Milos Dimic on 09.09.23.
//

import Models
import PostAPI

public final class PostsManagerMock: PostsManagerProtocol {

    // MARK: - Mocking

    public enum Action: Equatable {

        case fetchPosts(userID: Int)
        case fetchFavourites(ids: [Int]?)
        case updateFavourite(model: PostModel)
    }

    // MARK: - Public properties

    public var fetchPostsMockValue: [PostModel]!
    public var fetchFavouritesMockValue: [PostModel]!

    public var actions: [Action] = []

    // MARK: - Init

    public init() {}

    // MARK: - API

    public func fetchPosts(userID: Int) async throws -> [PostModel] {
        self.actions.append(.fetchPosts(userID: userID))
        return self.fetchPostsMockValue
    }

    public func fetchFavourites(ids: [Int]?) async throws -> [PostModel] {
        self.actions.append(.fetchFavourites(ids: ids))
        return self.fetchFavouritesMockValue
    }

    public func updateFavourite(model: PostModel) async throws {
        self.actions.append(.updateFavourite(model: model))
    }
}
