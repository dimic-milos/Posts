import SwiftUI
import Models

// MARK: - Coordinator

public protocol PostCoordinatorViewModelProtocol {}
public protocol PostCoordinatorViewProtocol: View {}

// MARK: - PostsManagerProtocol

public protocol PostsManagerProtocol {

    func fetchPosts(userID: Int) async throws -> [PostModel]
    func fetchFavourites(ids: [Int]?) async throws -> [PostModel]
    func updateFavourite(model: PostModel) async throws
}

// MARK: - Config

public struct PostCoordinatorConfig {

    public let useCase: PostCoordinatorUseCase
    public let userID: Int

    public init(useCase: PostCoordinatorUseCase, userID: Int) {
        self.useCase = useCase
        self.userID = userID
    }
}

// MARK: - UseCase

public enum PostCoordinatorUseCase {

    case combined
    case posts
    case favourites
}
