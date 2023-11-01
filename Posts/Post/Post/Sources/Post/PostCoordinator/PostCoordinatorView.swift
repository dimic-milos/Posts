//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import PostAPI

struct PostCoordinatorView: PostCoordinatorViewProtocol {

    // MARK: - Private properties

    @StateObject private var viewModel: PostCoordinatorViewModel

    // MARK: - Init

    init(viewModel: PostCoordinatorViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }

    // MARK: - Body

    var body: some View {
        NavigationStack(path: self.$viewModel.path) {
            self.view(for: .posts(viewModel: self.viewModel.postsContainerViewModel))
                .navigationDestination(
                    for: PostCoordinatorViewModel.Screen.self,
                    destination: self.view(for:)
                )
        }
    }
}

// MARK: - Views

private extension PostCoordinatorView {

    @ViewBuilder
    func view(for screen: PostCoordinatorViewModel.Screen) -> some View {
        switch screen {
        case .posts(let viewModel):
            PostsContainerView(viewModel: viewModel)
        case .comments(let viewModel):
            CommentsView(viewModel: viewModel)
        }
    }
}
