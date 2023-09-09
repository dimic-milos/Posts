import XCTest

public extension XCTestCase {

    func wait(for expectation: XCTestExpectation, timeout: TimeInterval = 1) {
        self.wait(for: [expectation], timeout: timeout)
    }
}
