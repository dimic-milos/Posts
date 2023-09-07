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

    // MARK: - Init
    
    override init() {
        super.init()

        self.routes = [.root(.posts(isFavourite: false), embedInNavigationView: true)]
    }
}

// MARK: - Screen

extension PostCoordinatorViewModel {

    enum Screen {

        case posts(isFavourite: Bool)
        case comments
    }
}
