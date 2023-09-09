import XCTest
import Combine
import Resolver
import Models
import PostAPI
import Testable
@testable import Post

final class AllPostsViewModelTests: XCTestCase {

    // MARK: - Private properties

    private var sut: AllPostsViewModel!
    private var manager: PostsManagerMock!

    private let userID = 1
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Life cycle

    override func setUp() {
        super.setUp()

        self.manager = .init()

        Resolver.resetRegistrations()
        Resolver.tests.register { self.manager }
            .implements(PostsManagerProtocol.self)

        self.sut = .init(userID: self.userID)
    }

    // MARK: - Tests

    func test_load_configsAreEmpty_triggersExpectedActions() {
        let posts: [PostModel] = (0...10).map { .fake(id: $0) }
        self.manager.fetchPostsMockValue = posts
        self.manager.fetchFavouritesMockValue = posts

        let exp = XCTestExpectation.modelFetched()
        
        self.sut.$configs.dropFirst().sink { _ in
            exp.fulfill()
        }
        .store(in: &self.cancellables)

        self.sut.load()
        self.wait(for: exp)

        self.assert(
            manager: [
                .fetchPosts(userID: self.userID),
                .fetchFavourites(ids: posts.map(\.id))
            ]
        )
    }

    func test_load_configsAreNotEmpty_triggersExpectedActions() {
        self.sut.configs = [.init(model: .fake(), isFavourite: true)]

        let posts: [PostModel] = [.fake()]
        self.manager.fetchPostsMockValue = posts
        self.manager.fetchFavouritesMockValue = posts

        let exp = XCTestExpectation.modelFetched()

        self.sut.$configs.dropFirst().sink { _ in
            exp.fulfill()
        }
        .store(in: &self.cancellables)

        self.sut.load()
        self.wait(for: exp)

        self.assert(
            manager: [
                .fetchFavourites(ids: posts.map(\.id))
            ]
        )
    }

    func test_handleDidTapStar_postIsNotMarkedAsFavourite_postIsMarkedAsFavourite() {
        let favourite: PostConfig = .init(model: .fake(id: 1), isFavourite: true)
        let nonFavourite: PostConfig = .init(model: .fake(id: 2), isFavourite: false)

        self.sut.configs = [favourite, nonFavourite]

        let exp = XCTestExpectation.modelFetched()

        self.sut.$configs.dropFirst().sink { _ in
            exp.fulfill()
        }
        .store(in: &self.cancellables)

        self.sut.handleDidTapStar(config: nonFavourite)
        self.wait(for: exp)

        self.assert(
            manager: [
                .updateFavourite(model: nonFavourite.model)
            ]
        )

        XCTAssertTrue(self.sut.configs.allSatisfy(\.isFavourite))
    }
}


// MARK: - Assert

private extension AllPostsViewModelTests {

    private func assert(manager managerActions: [PostsManagerMock.Action] = []) {
        XCTAssertEqual(self.manager.actions, managerActions)
    }
}

