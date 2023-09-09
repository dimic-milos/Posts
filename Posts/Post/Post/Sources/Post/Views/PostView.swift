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
    let useCase: UseCase
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
                self.onTap(.init(action: .didTapText, config: self.config))
            },
            label: {
                VStack(alignment: .leading, spacing: 16) {
                    Text(self.config.model.title).bold()
                    Text(self.config.model.body)
                }
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        )
        .disabled(self.useCase == .favourite)
    }

    var starView: some View {
        Image(systemName: self.config.isFavourite ? "star.fill" : "star")
            .onTapGesture {
                self.onTap(.init(action: .didTapStar, config: self.config))
            }
    }
}

extension PostView {

    enum UseCase {

        case posts
        case favourite
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
    let config: PostConfig
}
