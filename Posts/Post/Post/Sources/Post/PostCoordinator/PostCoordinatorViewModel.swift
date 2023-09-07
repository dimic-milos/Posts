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

@Observable final class PostCoordinatorViewModel:
    BaseCoordinatorViewModel<PostCoordinatorViewModel.Screen>,
    PostCoordinatorViewModelProtocol
{

    // MARK: - Public properties

    var postsContainerViewModel = PostsContainerViewModel()

    // MARK: - Init
    
    override init() {
        super.init()

        self.routes = [.root(.posts(viewModel: self.postsContainerViewModel))]

        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.routes.presentSheet(.comments)
        }
    }
}

// MARK: - Screen

extension PostCoordinatorViewModel {

    enum Screen {

        case posts(viewModel: PostsContainerViewModel)
        case comments
    }
}
