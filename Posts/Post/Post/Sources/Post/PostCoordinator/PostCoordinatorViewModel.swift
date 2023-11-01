//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import Combine
import Global
import PostAPI

final class PostCoordinatorViewModel: PostCoordinatorViewModelProtocol, ObservableObject {

    // MARK: - Public properties

    @Published var path = NavigationPath()

    private(set) var postsContainerViewModel: PostsContainerViewModel

    // MARK: - Private properties

    private var commentsViewModel: CommentsViewModel?
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Init
    
    init(config: PostCoordinatorConfig) {
        let postsContainerViewModel = PostsContainerViewModel(
            screen: config.screen,
            userID: config.userID
        )
        self.postsContainerViewModel = postsContainerViewModel
        self.subscribeToPostsContainerViewModelAction()
    }

    // MARK: - API

    func startPostFlow() {
        print("MiDi 12.12.2016", #file, #line, #function, self.path.count)
        self.path.append(Screen.posts(viewModel: postsContainerViewModel))
        print("MiDi 12.12.2016", #file, #line, #function, self.path.count)
    }

    // MARK: - Helpers

    private func startCommnetsFlow(config: PostConfig) {
        let commentsViewModel = CommentsViewModel(config: config)
        self.commentsViewModel = commentsViewModel
        self.path.append(Screen.comments(viewModel: commentsViewModel))
    }
}

// MARK: - Screen

extension PostCoordinatorViewModel {

    enum Screen: Equatable, Hashable {

        case posts(viewModel: PostsContainerViewModel)
        case comments(viewModel: CommentsViewModel)
    }
}

// MARK: - Subscribe

private extension PostCoordinatorViewModel {

    func subscribeToPostsContainerViewModelAction() {
        self.postsContainerViewModel.actionViewModel.$action.sink { [weak self] in
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
