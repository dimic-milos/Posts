//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

import SwiftUI
import Models
import Global

struct PostView: View {
    
    // MARK: - Public properties

    let config: PostConfig
    let onTap: Completion<ModelAction>

    // MARK: - Body

    var body: some View {
        HStack {
            self.postTextContentView
            self.starView
        }
    }
}

// MARK: - Views

private extension PostView {

    var postTextContentView: some View {
        Button(
            action: {
                self.onTap(.init(action: .didTapText, post: self.config.model))
            },
            label: {
                VStack {
                    Text(self.config.model.title)
                    Text(self.config.model.body)
                }
            }
        )
    }

    var starView: some View {
        Image(systemName: self.config.isFavourite ? "star.fill" : "star")
            .onTapGesture {
                self.onTap(.init(action: .didTapStar, post: self.config.model))
            }
    }
}


struct PostConfig: Hashable {

    let model: PostModel
    let isFavourite: Bool
}

enum TapAction {

    case didTapText
    case didTapStar
}

struct ModelAction {

    let action: TapAction
    let post: PostModel
}
