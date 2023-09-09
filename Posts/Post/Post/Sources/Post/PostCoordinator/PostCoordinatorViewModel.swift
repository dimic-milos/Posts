//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import Foundation
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

    // MARK: - Init
    
    init(userID: Int) {
        super.init()

        let postsContainerViewModel = PostsContainerViewModel(userID: userID)
        self.postsContainerViewModel = postsContainerViewModel
        self.routes = [.root(.posts(viewModel: postsContainerViewModel))]
        self.subscribeToPostsContainerViewModelAction()
    }
}

// MARK: - Screen

extension PostCoordinatorViewModel {

    enum Screen {

        case posts(viewModel: PostsContainerViewModel)
        case comments
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
            case .didTapPost(let id):
                self.routes.presentSheet(.comments)
            }
        }
        .store(in: &self.cancellables)
    }
}
