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

    lazy var allPostsViewModel = AllPostsViewModel(userID: self.userID)
    lazy var favouritePostsViewModel = FavouritePostsViewModel(userID: self.userID)

    // MARK: - Private properties

    private let userID: Int

    // MARK: - Init
    
    init(userID: Int) {
        self.userID = userID
        super.init()
    }
}

// MARK: - Actions

extension PostsContainerViewModel {

    enum Action {
     
        case didTapPost(id: Int)
    }
}
