//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

import Foundation
import Resolver

extension Resolver {

    static func registerServices(userID: Int) {
        self.register {
            PersistenceService(userID: userID)
        }
        .implements(PersistenceServiceProtocol.self)
    }
}
