//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import Foundation
import Models

final class AllPostsViewModel: PostsBaseViewModel {

    override func load() {
        Task {
            do {
                self.set(state: .loading)
                
                let posts: [PostModel] = try await {
                    if self.postConfigs.isEmpty {
                        return try await self.manager.fetchPosts(userID: self.userID)
                    } else {
                        return self.postConfigs.map(\.model)
                    }
                }()

                let favourites = try await self.manager.fetchFavourites(ids: posts.map(\.id))
                self.set(state: .success)

                await MainActor.run {
                    self.postConfigs = posts.map {
                        .init(model: $0, isFavourite: favourites.contains($0))
                    }
                }
            } catch {
                self.set(state: .failed)
            }
        }
    }

    override func update(model: PostModel) {
        self.postConfigs = self.postConfigs.map {
            if $0.model == model {
                return .init(model: model, isFavourite: !$0.isFavourite)
            } else {
                return $0
            }
        }
    }
}
