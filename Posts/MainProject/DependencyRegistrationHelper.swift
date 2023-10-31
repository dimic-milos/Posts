//
//  DependencyRegistrationHelper.swift
//  Posts
//
//  Created by Milos Dimic on 07.09.23.
//

import Network
import Persistence
import Login
import Post

import Resolver

enum DependencyRegistrationHelper {

    static func register() {
        NetworkModule.registerDependencies()
        LoginModule.registerDependencies()
        PostModule.registerDependencies()
    }

    static func registerDatabase(userID: Int) {
        PersistenceModule.registerDependencies(userID: userID)
    }
}
