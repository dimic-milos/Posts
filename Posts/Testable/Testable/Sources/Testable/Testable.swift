import XCTest

public extension XCTestExpectation {

    static func modelFetched() -> XCTestExpectation {
        XCTestExpectation(description: "Model fetched")
    }

    static func asyncOperation() -> XCTestExpectation {
        XCTestExpectation(description: "Async Operation")
    }
}

public extension XCTestCase {

    func wait(for expectation: XCTestExpectation, timeout: TimeInterval = 1) {
        self.wait(for: [expectation], timeout: timeout)
    }
}
