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

protocol PostsBaseViewModelProtocol: ContentStateObservable {

    var configs: [PostConfig] { get }

    func load()
    func handle(action: ModelAction)
}

class PostsBaseViewModel: 
    BaseActionViewModel<PostsBaseViewModel.Action>,
    PostsBaseViewModelProtocol
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

    final func handle(action: ModelAction) {
        switch action.action {
        case .didTapText:
            self.actionViewModel.action = .didTapPost(config: action.config)
        case .didTapStar:
            Task {
                let model = action.config.model
                try? await self.manager.updateFavourite(model: model)
                self.update(model: model)
            }
        }
    }
}

// MARK: - Actions

extension PostsBaseViewModel {

    enum Action {

        case didTapPost(config: PostConfig)
    }
}
