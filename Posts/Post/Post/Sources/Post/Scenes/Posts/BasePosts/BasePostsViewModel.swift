//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import Combine
import Resolver
import Global
import Models
import UI
import PostAPI

protocol BasePostsViewModelProtocol: ContentStateObservable {

    var configs: [PostConfig] { get }

    func load()
    func handleDidTapText(config: PostConfig)
    func handleDidTapStar(config: PostConfig)
}

class BasePostsViewModel: 
    BaseActionViewModel<BasePostsViewModel.Action>,
    BasePostsViewModelProtocol
{

    // MARK: - Public properties

    var state: ContentState = .loading
    let userID: Int

    @Published var configs: [PostConfig] = []

    @Injected private(set) var manager: PostsManagerProtocol

    // MARK: - Init

    init(userID: Int) {
        self.userID = userID
        super.init()
    }

    // MARK: - API

    func load() {
        fatalError("Override")
    }

    func update(model: PostModel) {
        fatalError("Override")
    }

    func handleDidTapText(config: PostConfig) {
        self.actionViewModel.action = .didTapPost(config: config)
    }

    func handleDidTapStar(config: PostConfig) {
        Task {
            let model = config.model
            try? await self.manager.updateFavourite(model: model)
            self.update(model: model)
        }
    }
}

// MARK: - Actions

extension BasePostsViewModel {

    enum Action {

        case didTapPost(config: PostConfig)
    }
}
