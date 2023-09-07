//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import PostAPI
import Resolver

extension Resolver {

    static func registerCoordinators() {
        self.register {
            PostCoordinatorViewModel()
        }
        .implements(PostCoordinatorViewModelProtocol.self)

        self.register { _, args in
            PostCoordinatorView(viewModel: args())
        }
        .implements((any PostCoordinatorViewProtocol).self)
    }

    static func registerServices() {

    }

    static func registerManagers() {

    }
}
