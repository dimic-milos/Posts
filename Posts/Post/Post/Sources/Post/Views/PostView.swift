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
        self.content
    }
}

// MARK: - Views

private extension PostView {

    var content: some View {
        HStack(spacing: 24) {
            self.postTextButtonView
            self.starView
        }
    }

    var postTextButtonView: some View {
        Button(
            action: { self.onTap(.init(action: .didTapText, config: self.config)) },
            label: { self.postTextContentView }
        )
        .disabled(self.useCase == .favourite)
    }

    var postTextContentView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(self.config.model.title).bold()
            Text(self.config.model.body)
        }
        .multilineTextAlignment(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    var starView: some View {
        Image(systemName: self.config.isFavourite ? "star.fill" : "star")
            .foregroundStyle(.yellow)
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

    enum TapAction {

        case didTapText
        case didTapStar
    }
}

struct ModelAction {

    let action: PostView.TapAction
    let config: PostConfig
}
