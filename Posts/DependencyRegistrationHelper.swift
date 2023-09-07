//
//  DependencyRegistrationHelper.swift
//  Posts
//
//  Created by Milos Dimic on 07.09.23.
//

import Login
import Post

enum DependencyRegistrationHelper {

    static func register() {
        LoginModule.registerDependencies()
        PostModule.registerDependencies()
    }

    static func registerDatabase(id: Int) {

    }
}
