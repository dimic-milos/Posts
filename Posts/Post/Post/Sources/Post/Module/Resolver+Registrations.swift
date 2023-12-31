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
        self.register { _, args in
            PostCoordinatorViewModel(userID: args())
        }
        .implements(PostCoordinatorViewModelProtocol.self)

        self.register { _, args in
            PostCoordinatorView(viewModel: args())
        }
        .implements((any PostCoordinatorViewProtocol).self)
    }

    static func registerServices() {
        self.register {
            PostsService()
        }
        .implements(PostsServiceProtocol.self)
        .scope(.application)

        self.register {
            CommentsService()
        }
        .implements(CommentsServiceProtocol.self)
        .scope(.application)
    }

    static func registerManagers() {
        self.register {
            PostsManager()
        }
        .implements(PostsManagerProtocol.self)
        .scope(.application)

        self.register {
            CommentsManager()
        }
        .implements(CommentsManagerProtocol.self)
        .scope(.application)
    }
}
