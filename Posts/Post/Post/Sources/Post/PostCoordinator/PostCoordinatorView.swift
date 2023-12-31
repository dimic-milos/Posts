//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import FlowStacks
import PostAPI

struct PostCoordinatorView: PostCoordinatorViewProtocol {

    // MARK: - Private properties

    @State private var viewModel: PostCoordinatorViewModel

    // MARK: - Init

    init(viewModel: PostCoordinatorViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body

    var body: some View {
        self.content
    }
}

// MARK: - Views

private extension PostCoordinatorView {

    var content: some View {
        Router(self.$viewModel.routes) { screen, _ in
            switch screen {
            case .posts(let viewModel):
                PostsContainerView(viewModel: viewModel)
            case .comments(let viewModel):
                CommentsView(viewModel: viewModel)
            }
        }
    }
}
