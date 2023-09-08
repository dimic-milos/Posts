//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

import Resolver

public enum PersistenceModule {

    public static func registerDependencies(userID: Int) {
        Resolver.registerServices(userID: userID)
    }
}
