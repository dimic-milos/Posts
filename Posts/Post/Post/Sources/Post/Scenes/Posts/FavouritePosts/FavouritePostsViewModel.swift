//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import Foundation
import Models

final class FavouritePostsViewModel: PostsBaseViewModel {

    override func load() {
        Task {
            do {
                self.set(state: .loading)
                let posts = try await self.manager.fetchFavourites(ids: nil)
                self.set(state: .success)

                await MainActor.run {
                    self.postConfigs = posts.map { .init(model: $0, isFavourite: true) }
                }
            } catch {
                self.set(state: .failed)
            }
        }
    }

    override func update(model: PostModel) {
        self.postConfigs = self.postConfigs.filter { $0.model != model }
    }
}
