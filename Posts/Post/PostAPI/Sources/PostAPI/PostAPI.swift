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
