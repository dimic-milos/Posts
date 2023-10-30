//
//  TabCoordinatorView.swift
//  Posts
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import FlowStacks
import Resolver
import UI
import LoginAPI
import PostAPI

struct TabCoordinatorView: View {

    // MARK: - Private properties

    @State private var viewModel: TabCoordinatorViewModel
    @State private var loginCoordinatorAction: LoginCoordinatorAction?

    // MARK: - Init

    init(viewModel: TabCoordinatorViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body

    var body: some View {
        self.content
            .onFirstAppear {
                self.viewModel.startLoginFlow(action: self.$loginCoordinatorAction)
            }
            .onChange(of: self.loginCoordinatorAction, initial: false) { _, newValue in
                newValue.map(self.viewModel.handle(loginCoordinatorAction:))
            }
    }
}

// MARK: - Views

private extension TabCoordinatorView {

    var content: some View {
        Router(self.$viewModel.routes) { screen, _ in
            switch screen {
            case .login(let viewModel):
                self.makeLoginCoordinatorView(viewModel: viewModel)
            case .posts(let viewModel):
                self.makePostsCoordinatorView(viewModel: viewModel)
            }
        }
    }

    func makeLoginCoordinatorView(viewModel: LoginCoordinatorViewModelProtocol) -> some View {
        let view: any LoginCoordinatorViewProtocol = Resolver.resolve(args: viewModel)
        return AnyView(view)
    }

    func makePostsCoordinatorView(viewModel: PostCoordinatorViewModelProtocol) -> some View {
        let view: any PostCoordinatorViewProtocol = Resolver.resolve(args: viewModel)
        return AnyView(view)
    }
}
