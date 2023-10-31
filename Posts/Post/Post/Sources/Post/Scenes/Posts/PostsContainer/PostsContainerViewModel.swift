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

protocol PostsContainerViewModelProtocol: ObservableObject {

    var useCase: PostCoordinatorUseCase { get }
    var allPostsViewModel: AllPostsViewModel { get }
    var favouritePostsViewModel: FavouritePostsViewModel { get }
}

final class PostsContainerViewModel:
    BaseActionViewModel<PostsContainerViewModel.Action>,
    PostsContainerViewModelProtocol
{

    // MARK: - Public properties

    let useCase: PostCoordinatorUseCase

    lazy var allPostsViewModel = AllPostsViewModel(userID: self.userID)
    lazy var favouritePostsViewModel = FavouritePostsViewModel(userID: self.userID)

    // MARK: - Private properties

    private let uuid = UUID()
    private let userID: Int
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Init
    
    init(useCase: PostCoordinatorUseCase, userID: Int) {
        self.useCase = useCase
        self.userID = userID
        super.init()
        
        self.subscribeToAllPostsViewModelAction()
        self.subscribeToFavouritePostsViewModelAction()
    }
}

// MARK: - Actions

extension PostsContainerViewModel {

    enum Action {
     
        case didTapPost(config: PostConfig)
    }
}

// MARK: - Subscribe

private extension PostsContainerViewModel {

    func subscribeToAllPostsViewModelAction() {
        self.allPostsViewModel.actionViewModel.$action.sink { [weak self] in
            guard let self, let action = $0 else {
                return
            }
            switch action {
            case .didTapPost(let config):
                self.actionViewModel.action = .didTapPost(config: config)
            }
        }
        .store(in: &self.cancellables)
    }

    func subscribeToFavouritePostsViewModelAction() {
        self.favouritePostsViewModel.actionViewModel.$action.sink { [weak self] in
            guard let self, let action = $0 else {
                return
            }
            switch action {
            case .didTapPost(let config):
                self.actionViewModel.action = .didTapPost(config: config)
            }
        }
        .store(in: &self.cancellables)
    }
}

extension PostsContainerViewModel: Equatable, Hashable {

    static func == (lhs: PostsContainerViewModel, rhs: PostsContainerViewModel) -> Bool {
        lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self)
    }
}
