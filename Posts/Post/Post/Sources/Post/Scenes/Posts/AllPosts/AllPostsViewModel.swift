//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import Foundation

final class AllPostsViewModel: PostsBaseViewModel {

    override func load() {
        Task {
            do {
                self.set(state: .loading)
                let posts = try await self.manager.fetchPosts(userID: 1)
                let favourites = try await self.manager.fetchFavourites(ids: posts.map(\.id))
                print("MiDi 12.12.2016", #file, #line, #function, posts)
                print("MiDi 12.12.2016", #file, #line, #function, favourites)
                self.set(state: .success)
                await MainActor.run {
                    self.postConfigs = posts.map {
                        .init(
                            model: $0,
                            isFavourite: favourites.contains($0)
                        )
                    }
                }

            } catch {
                self.set(state: .failed)
                print("MiDi 12.12.2016", #file, #line, #function, error)
            }

        }

    }
}
