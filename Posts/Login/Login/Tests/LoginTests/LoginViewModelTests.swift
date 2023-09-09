import XCTest
import Combine
import Testable
@testable import Login

final class LoginViewModelTests: XCTestCase {

    // MARK: - Private properties

    private var sut: LoginViewModel!
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Life cycle

    override func setUp() {
        super.setUp()

        self.sut = .init()
    }

    func test_login_noPrecondition_triggersActionWithExpectedID() {
        let expectedID = 1
        let exp = XCTestExpectation.asyncOperation()
        var action: LoginViewModel.Action?

        self.sut.actionViewModel.$action.dropFirst().sink {
                action = $0
                exp.fulfill()
        }
        .store(in: &self.cancellables)

        self.sut.login(userID: expectedID)
        self.wait(for: exp)
        XCTAssertEqual(action, .didTapLogin(userID: expectedID))
    }
}
