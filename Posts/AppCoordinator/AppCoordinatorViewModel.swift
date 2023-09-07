//
//  AppCoordinatorViewModel.swift
//  Posts
//
//  Created by Milos Dimic on 07.09.23.
//

import Foundation
import FlowStacks
import Global

@Observable final class AppCoordinatorViewModel: BaseCoordinatorViewModel<AppCoordinatorViewModel.Screen> {

    // MARK: - Init

    override init() {
        super.init()

        self.routes = [.root(.login, embedInNavigationView: true)]
    }
}

// MARK: - Screen

extension AppCoordinatorViewModel {

    enum Screen {

        case login
        case posts
    }
}
