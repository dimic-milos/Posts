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
import PostAPI

final class PostCoordinatorViewModel:
    BaseCoordinatorViewModel<PostCoordinatorViewModel.Screen>,
    PostCoordinatorViewModelProtocol
{

    // MARK: - Private properties

    private var postsContainerViewModel: PostsContainerViewModel?
    private var commentsViewModel: CommentsViewModel?

    // MARK: - Init
    
    init(userID: Int) {
        super.init()

        self.startPostsFlow(userID: userID)
    }

    // MARK: - Helpers

    private func startPostsFlow(userID: Int) {
        let postsContainerViewModel = PostsContainerViewModel(userID: userID)
        self.postsContainerViewModel = postsContainerViewModel
        self.routes = [.root(.posts(viewModel: postsContainerViewModel))]
        self.subscribeToPostsContainerViewModelAction()
    }

    private func startCommnetsFlow(config: PostConfig) {
        let commentsViewModel = CommentsViewModel(config: config)
        self.commentsViewModel = commentsViewModel
        self.routes.push(.comments(viewModel: commentsViewModel))
    }
}

// MARK: - Screen

extension PostCoordinatorViewModel {

    enum Screen {

        case posts(viewModel: PostsContainerViewModel)
        case comments(viewModel: CommentsViewModel)
    }
}

// MARK: - Subscribe

private extension PostCoordinatorViewModel {

    func subscribeToPostsContainerViewModelAction() {
        self.postsContainerViewModel?.actionViewModel.$action.sink { [weak self] in
            guard let self, let action = $0 else {
                return
            }
            switch action {
            case .didTapPost(let config):
                self.startCommnetsFlow(config: config)
            }
        }
        .store(in: &self.cancellables)
    }
}
