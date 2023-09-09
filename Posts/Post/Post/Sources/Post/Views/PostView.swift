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
        HStack(spacing: 24) {
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
                self.onTap(.init(action: .didTapText, model: self.config.model))
            },
            label: {
                VStack(alignment: .leading, spacing: 16) {
                    Text(self.config.model.title)
                    Text(self.config.model.body)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        )
    }

    var starView: some View {
        Image(systemName: self.config.isFavourite ? "star.fill" : "star")
            .onTapGesture {
                self.onTap(.init(action: .didTapStar, model: self.config.model))
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
    let model: PostModel
}
