//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import Global

protocol PostsContainerViewModelProtocol: ObservableObject {

    var allPostsViewModel: AllPostsViewModel { get }
    var favouritePostsViewModel: FavouritePostsViewModel { get }
}

final class PostsContainerViewModel:
    BaseActionViewModel<PostsContainerViewModel.Action>,
    PostsContainerViewModelProtocol
{

    // MARK: - Public properties

    var allPostsViewModel = AllPostsViewModel()
    var favouritePostsViewModel = FavouritePostsViewModel()

    // MARK: - Init
    
    override init() {
        super.init()
    }
}

// MARK: - Actions

extension PostsContainerViewModel {

    enum Action {
     
        case didTapPost(id: Int)
    }
}
