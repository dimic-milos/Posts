//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

import Resolver

public enum NetworkModule {

    public static func registerDependencies() {
        Resolver.registerClients()
        Resolver.registerServices()
    }
}

