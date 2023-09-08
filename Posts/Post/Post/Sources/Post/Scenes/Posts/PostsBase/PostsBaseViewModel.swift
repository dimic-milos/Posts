//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import Foundation
import Combine
import Resolver
import Global
import Models
import UI

protocol PostsBaseViewModelProtocol: ContentStateObservable {

    var postConfigs: [PostConfig] { get }

    func load()
    func handle(modelAction: ModelAction)
}

class PostsBaseViewModel: 
    BaseActionViewModel<PostsBaseViewModel.Action>,
    PostsBaseViewModelProtocol
{

    // MARK: - Public properties

    var state: ContentState = .loading
    let userID: Int

    @Published var postConfigs: [PostConfig] = []

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

    final func handle(modelAction: ModelAction) {
        switch modelAction.action {
        case .didTapText:
            print("MiDi 12.12.2016", #file, #line, #function)
        case .didTapStar:
            print("MiDi 12.12.2016", #file, #line, #function)
        }
    }

    final func didTap(model: PostModel) {
        self.actionViewModel.action = .didTapPost(id: model.id)
    }
}

// MARK: - Actions

extension PostsBaseViewModel {

    enum Action {

        case didTapPost(id: Int)
    }
}
