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

@Observable final class AppCoordinatorViewModel {

    // MARK: - Public properties

    var sidebar: SidebarScreen?
    let sidebars: [SidebarScreen] = [.main]

    var content: ContentScreen?
    let contents: [ContentScreen] = [.combined, .posts, .favourites]

    var shouldShowLogin = true
    private(set) var userID: Int?

    private(set) var loginCoordinatorViewModel: LoginCoordinatorViewModelProtocol?
    private(set) var postCoordinatorViewModel: PostCoordinatorViewModelProtocol?

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
            self.makePostCoordinatorViewModel()
        }
    }

    func makePostCoordinatorViewModel() {
        guard let userID else {
            return
        }
        let useCase: PostCoordinatorUseCase = {
            switch (self.content ?? .combined) {
            case .combined:
                return .combined
            case .posts:
                return .posts
            case .favourites:
                return .favourites
            }
        }()

        let config: PostCoordinatorConfig = .init(
            useCase: useCase,
            userID: userID
        )
        let viewModel: PostCoordinatorViewModelProtocol = Resolver.resolve(
            args: config
        )

        self.postCoordinatorViewModel = viewModel
    }
}
