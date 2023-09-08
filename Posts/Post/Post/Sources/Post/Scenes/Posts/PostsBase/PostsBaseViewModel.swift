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
    func handle(action: ModelAction)
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

    final func handle(action: ModelAction) {
        switch action.action {
        case .didTapText:
            print("MiDi 12.12.2016", #file, #line, #function)
            self.actionViewModel.action = .didTapPost(id: action.model.id)
        case .didTapStar:
            print("MiDi 12.12.2016", #file, #line, #function)
            Task {
                do {
                    try await self.manager.updateFavourite(model: action.model)
                } catch {
                    print("MiDi 12.12.2016", #file, #line, #function, error)
                }

            }
        }
    }
}

// MARK: - Actions

extension PostsBaseViewModel {

    enum Action {

        case didTapPost(id: Int)
    }
}
