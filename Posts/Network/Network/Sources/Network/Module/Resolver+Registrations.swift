//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

import Resolver

extension Resolver {

    static func registerClients() {
        self.register {
            NetworkClient()
        }
        .implements(NetworkClientProtocol.self)
        .scope(.application)
    }

    static func registerServices() {
        self.register {
            NetworkService()
        }
        .implements(NetworkServiceProtocol.self)
        .scope(.application)
    }
}
