//
//  AppCoordinatorView.swift
//  Posts
//
//  Created by Milos Dimic on 30.10.23.
//

import SwiftUI
import Resolver
import LoginAPI
import PostAPI

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
        NavigationSplitView(
            sidebar: { self.sidebarView },
            content: { self.contentView },
            detail: { self.detailView }
        )
        .onChange(of: self.loginCoordinatorAction, initial: false) { _, newValue in
            newValue.map(self.viewModel.handle(loginCoordinatorAction:))
        }
        .onChange(of: self.viewModel.content) { _, newValue in
            self.viewModel.makePostCoordinatorViewModel()
        }
        .fullScreenCover(
            isPresented: self.$viewModel.shouldShowLogin,
            content: { self.loginView }
        )
    }
}

// MARK: - Navigation Split Views

private extension AppCoordinatorView {

    var sidebarView: some View {
        List(selection: self.$viewModel.sidebar) {
            ForEach(self.viewModel.sidebars, id: \.self) {
                Text($0.name)
            }
        }
    }

    var contentView: some View {
        List(selection: self.$viewModel.content) {
            ForEach(self.viewModel.contents, id: \.self) {
                Text($0.name)
            }
        }
    }

    @ViewBuilder
    var detailView: some View {
        if let viewModel = self.viewModel.postCoordinatorViewModel {
            self.makePostsCoordinatorView(viewModel: viewModel)
        } else {
            Text("N/A")
        }
    }
}

// MARK: - Login

private extension AppCoordinatorView {

    var loginView: some View {
        let viewModel = self.viewModel.makeLoginCoordinatorViewModel(
            action: self.$loginCoordinatorAction
        )
        return self.makeLoginCoordinatorView(viewModel: viewModel)
    }

    func makeLoginCoordinatorView(
        viewModel: LoginCoordinatorViewModelProtocol
    ) -> some View {
        let view: any LoginCoordinatorViewProtocol = Resolver.resolve(args: viewModel)
        return AnyView(view)
    }
}

// MARK: - Post

private extension AppCoordinatorView {

    func makePostsCoordinatorView(
        viewModel: PostCoordinatorViewModelProtocol
    ) -> some View {
        let view: any PostCoordinatorViewProtocol = Resolver.resolve(args: viewModel)
        return AnyView(view)
    }
}
