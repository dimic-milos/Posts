//
//  AppCoordinatorView.swift
//  Posts
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import FlowStacks
import Resolver

struct AppCoordinatorView: View {

    // MARK: - Private properties

    @State private var viewModel: AppCoordinatorViewModel

    // MARK: - Init

    init(viewModel: AppCoordinatorViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body

    var body: some View {
        self.content
    }
}

// MARK: - Views

private extension AppCoordinatorView {

    var content: some View {
        Router(self.$viewModel.routes) { screen, _ in
            switch screen {
            case .login:
                Text("self.loginView")
            case .posts:
                Text("self.homeView")
            }
        }
    }
}
