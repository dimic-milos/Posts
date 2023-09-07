//
//  AppCoordinatorView.swift
//  Posts
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import FlowStacks
import Resolver
import LoginAPI

struct AppCoordinatorView: View {

    // MARK: - Private properties

    @State private var viewModel: AppCoordinatorViewModel
    @State private var loginCoordinatorAction: LoginCoordinatorAction?

    // MARK: - Init

    init(viewModel: AppCoordinatorViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body

    var body: some View {
        self.content
            .onAppear {
                self.viewModel.startLoginFlow(action: self.$loginCoordinatorAction)
            }
            .onChange(of: self.loginCoordinatorAction, initial: false) { _, newValue in
                print("MiDi 12.12.2016", #file, #line, #function, newValue!)
            }
    }
}

// MARK: - Views

private extension AppCoordinatorView {

    var content: some View {
        Router(self.$viewModel.routes) { screen, _ in
            switch screen {
            case .login(let viewModel):
                self.makeLoginView(viewModel: viewModel)
            case .posts:
                Text("self.homeView")
            }
        }
    }

    func makeLoginView(viewModel: LoginCoordinatorViewModelProtocol) -> some View {
        let view: any LoginCoordinatorViewProtocol = Resolver.resolve(args: viewModel)
        return AnyView(view)
    }
}
