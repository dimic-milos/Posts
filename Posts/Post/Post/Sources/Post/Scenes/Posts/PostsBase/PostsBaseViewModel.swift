//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import Foundation
import Global
import UI

protocol PostsBaseViewModelProtocol: ContentStateObservable {

   func load()
   func didTapStar()
   func didTapPost(id: Int)
}

@Observable class PostsBaseViewModel: 
    BaseActionViewModel<PostsBaseViewModel.Action>,
    PostsBaseViewModelProtocol
{
    
    // MARK: - Public properties

    var state: ContentState = .success

    // MARK: - API

    func load() {
        fatalError("Override")
    }

    func didTapStar() {
        fatalError("Override")
    }

    final func didTapPost(id: Int) {
        self.actionViewModel.action = .didTapPost(id: id)
    }
}

// MARK: - Actions

extension PostsBaseViewModel {

    enum Action {

        case didTapPost(id: Int)
    }
}
