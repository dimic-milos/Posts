//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import Resolver
import LoginAPI

extension Resolver {

    static func registerCoordinators() {
        self.register {
            LoginCoordinatorViewModel()
        }
        .implements(LoginCoordinatorViewModelProtocol.self)

        self.register { _, args in
            LoginCoordinatorView(viewModel: args())
        }
        .implements((any LoginCoordinatorViewProtocol).self)
    }

    static func registerServices() {

    }

    static func registerManagers() {

    }
}
