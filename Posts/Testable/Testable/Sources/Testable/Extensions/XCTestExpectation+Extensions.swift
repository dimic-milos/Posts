//
//  File.swift
//  
//
//  Created by Milos Dimic on 09.09.23.
//

import XCTest

public extension XCTestExpectation {

    static func modelFetched() -> XCTestExpectation {
        XCTestExpectation(description: "Model fetched")
    }

    static func asyncOperation() -> XCTestExpectation {
        XCTestExpectation(description: "Async Operation")
    }
}
