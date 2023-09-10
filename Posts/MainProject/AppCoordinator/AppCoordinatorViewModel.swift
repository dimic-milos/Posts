//
//  AppCoordinatorViewModel.swift
//  Posts
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import Resolver
import FlowStacks
import Global
import LoginAPI
import PostAPI

final class AppCoordinatorViewModel: BaseCoordinatorViewModel<AppCoordinatorViewModel.Screen> {

    // MARK: - Private properties

    private var loginCoordinatorViewModel: LoginCoordinatorViewModelProtocol?
    private var postCoordinatorViewModel: PostCoordinatorViewModelProtocol?

    // MARK: - API

    func startLoginFlow(action: Binding<LoginCoordinatorAction?>) {
        let viewModel: LoginCoordinatorViewModelProtocol = Resolver.resolve(args: action)
        self.loginCoordinatorViewModel = viewModel
        self.routes = [.root(.login(viewModel), embedInNavigationView: true)]
    }

    func handle(loginCoordinatorAction: LoginCoordinatorAction) {
        switch loginCoordinatorAction {
        case .didLogin(let userID):
            DependencyRegistrationHelper.registerDatabase(userID: userID)
            self.startPostFlow(userID: userID)
        }
    }

    // MARK: - Helpers

    private func startPostFlow(userID: Int) {
        let viewModel: PostCoordinatorViewModelProtocol = Resolver.resolve(args: userID)
        self.postCoordinatorViewModel = viewModel
        self.routes.push(.posts(viewModel))
    }
}

// MARK: - Screen

extension AppCoordinatorViewModel {

    enum Screen {

        case login(LoginCoordinatorViewModelProtocol)
        case posts(PostCoordinatorViewModelProtocol)
    }
}
