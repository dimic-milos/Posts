//
//  AppCoordinatorViewModel.swift
//  Posts
//
//  Created by Milos Dimic on 30.10.23.
//

import SwiftUI
import Resolver
import LoginAPI
import PostAPI
import Global

@Observable final class AppCoordinatorViewModel {

    // MARK: - Public properties

    var sidebar: SidebarScreen?
    let sidebars: [SidebarScreen] = [.main]

    var content: ContentScreen?
    let contents: [ContentScreen] = [.combined, .posts, .favourites]

    var shouldShowLogin = true
    private(set) var userID: Int = .init()

    private(set) var loginCoordinatorViewModel: LoginCoordinatorViewModelProtocol?
    
    private(set) var combinedPostCoordinatorViewModel: PostCoordinatorViewModelProtocol?
    private(set) var postsCoordinatorViewModel: PostCoordinatorViewModelProtocol?
    private(set) var favouritesPostCoordinatorViewModel: PostCoordinatorViewModelProtocol?

    // MARK: - API

    func makeLoginCoordinatorViewModel(
        action: Binding<LoginCoordinatorAction?>
    ) -> LoginCoordinatorViewModelProtocol {
        let viewModel: LoginCoordinatorViewModelProtocol = Resolver.resolve(
            args: action
        )
        self.loginCoordinatorViewModel = viewModel
        return viewModel
    }

    func handle(loginCoordinatorAction: LoginCoordinatorAction) {
        switch loginCoordinatorAction {
        case .didLogin(let userID):
            DependencyRegistrationHelper.registerDatabase(userID: userID)
            self.userID = userID
            self.shouldShowLogin = false
        }
    }

    func makePostCoordinatorViewModel(screen: ContentScreen) -> PostCoordinatorViewModelProtocol {
        // Return cached if possible
        switch screen {
        case .combined:
            if let combinedPostCoordinatorViewModel {
                return combinedPostCoordinatorViewModel
            }
        case .posts:
            if let postsCoordinatorViewModel {
                return postsCoordinatorViewModel
            }
        case .favourites:
            if let favouritesPostCoordinatorViewModel {
                return favouritesPostCoordinatorViewModel
            }
        }

        let config: PostCoordinatorConfig = .init(
            screen: screen,
            userID: userID
        )
        let viewModel: PostCoordinatorViewModelProtocol = Resolver.resolve(
            args: config
        )

        switch screen {
        case .combined:
            self.combinedPostCoordinatorViewModel = viewModel
        case .posts:
            self.postsCoordinatorViewModel = viewModel
        case .favourites:
            self.favouritesPostCoordinatorViewModel = viewModel
        }

        return viewModel
    }
}
