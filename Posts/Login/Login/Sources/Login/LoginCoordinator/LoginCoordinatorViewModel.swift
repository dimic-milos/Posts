//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import Combine
import FlowStacks
import Global
import LoginAPI

final class LoginCoordinatorViewModel:
    BaseCoordinatorViewModel<LoginCoordinatorViewModel.Screen>,
    LoginCoordinatorViewModelProtocol
{

    // MARK: - Private properties

    @Binding private var coordinatorAction: LoginCoordinatorAction?

    private var loginViewModel: LoginViewModel?

    // MARK: - Init

    init(coordinatorAction: Binding<LoginCoordinatorAction?>) {
        self._coordinatorAction = coordinatorAction
        super.init()

        self.startLoginFlow()
    }

    // MARK: - API

    func didLogin(userID: Int) {
        self.coordinatorAction = .didLogin(userID: userID)
    }

    // MARK: - Helpers

    func startLoginFlow() {
        let loginViewModel = LoginViewModel()
        self.loginViewModel = loginViewModel
        self.subscribeToLoginViewModelActions()
        self.routes = [.root(.login(viewModel: loginViewModel))]
    }
}

// MARK: - Subscriptions

extension LoginCoordinatorViewModel {

    func subscribeToLoginViewModelActions() {
        self.loginViewModel?.actionViewModel.$action.sink { [weak self] in
            guard let self, let action = $0 else {
                return
            }
            switch action {
            case .didTapLogin(let userID):
                self.coordinatorAction = .didLogin(userID: userID)
            }
        }
        .store(in: &self.cancellables)
    }
}

// MARK: - Screen

extension LoginCoordinatorViewModel {

    enum Screen {

        case login(viewModel: LoginViewModel)
    }
}
