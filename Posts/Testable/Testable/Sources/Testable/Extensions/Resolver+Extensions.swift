//
//  File.swift
//  
//
//  Created by Milos Dimic on 09.09.23.
//

import Resolver

public extension Resolver {

    static var tests: Resolver!

    static func resetRegistrations() {
        Resolver.tests = Resolver(child: .main)
        Resolver.root = .tests
    }
}
