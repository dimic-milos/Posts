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
        self.register { _, args in
            LoginCoordinatorViewModel(coordinatorAction: args())
        }
        .implements(LoginCoordinatorViewModelProtocol.self)

        self.register { _, args in
            LoginCoordinatorView(viewModel: args())
        }
        .implements((any LoginCoordinatorViewProtocol).self)
    }
}
