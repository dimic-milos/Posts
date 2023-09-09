//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import Resolver
import UI
import Models
import Global

protocol CommentsViewModelProtocol: ContentStateObservable {

    var config: PostConfig { get }
    var comments: [CommentModel] { get }

    func load()
    func handleDidTapstar(config: PostConfig)
}

final class CommentsViewModel: CommentsViewModelProtocol {

    // MARK: - Public properties

    var state: ContentState = .loading

    @Published var comments: [CommentModel] = []
    @Published var config: PostConfig

    // MARK: - Private properties

    @Injected private var postsManager: PostsManagerProtocol
    @Injected private var commentsManager: CommentsManagerProtocol

    // MARK: - Init

    init(config: PostConfig) {
        self.config = config
    }

    // MARK: - API

    func load() {
        Task {
            self.set(state: .loading)
            do {
                let comments = try await self.commentsManager.fetchComments(
                    postID: self.config.model.id
                )
                self.set(state: .success)
                await MainActor.run {
                    self.comments = comments
                }
            } catch {
                self.set(state: .failed)
            }
        }
    }

    func handleDidTapstar(config: PostConfig) {
        Task {
            do {
                let model = config.model
                try await self.postsManager.updateFavourite(model: model)

                await MainActor.run {
                    self.config = .init(
                        model: model,
                        isFavourite: !self.config.isFavourite
                    )
                }
            } catch {
                self.set(state: .failed)
            }
        }
    }
}
