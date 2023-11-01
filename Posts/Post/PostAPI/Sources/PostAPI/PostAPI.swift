import SwiftUI
import Models
import Global

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

    public let screen: ContentScreen
    public let userID: Int

    public init(screen: ContentScreen, userID: Int) {
        self.screen = screen
        self.userID = userID
    }
}
