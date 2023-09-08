//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import Foundation
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
    }
}

// MARK: - Screen

extension PostCoordinatorViewModel {

    enum Screen {

        case posts(viewModel: PostsContainerViewModel)
        case comments
    }
}
