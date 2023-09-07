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

@Observable final class AppCoordinatorViewModel: BaseCoordinatorViewModel<AppCoordinatorViewModel.Screen> {

    // MARK: - Private properties

    private var loginCoordinatorViewModel: LoginCoordinatorViewModelProtocol?

    // MARK: - Init

    override init() {
        super.init()
    }

    // MARK: - API

    func startLoginFlow(action: Binding<LoginCoordinatorAction?>) {
        let viewModel: LoginCoordinatorViewModelProtocol = Resolver.resolve(args: action)
        self.loginCoordinatorViewModel = viewModel
        self.routes = [.root(.login(viewModel), embedInNavigationView: true)]
    }
}

// MARK: - Screen

extension AppCoordinatorViewModel {

    enum Screen {

        case login(LoginCoordinatorViewModelProtocol)
        case posts(PostCoordinatorViewModelProtocol)
    }
}
