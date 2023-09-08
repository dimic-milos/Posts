//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import Foundation

final class FavouritePostsViewModel: PostsBaseViewModel {

    override func load() {
        Task {
            do {
                self.set(state: .loading)
                let posts = try self.manager.fetchFavourites(ids: nil)
                print("MiDi 12.12.2016", #file, #line, #function, posts)
                self.set(state: .success)
                await MainActor.run {
                    self.postConfigs = posts.map { .init(model: $0, isFavourite: true) }
                }
            } catch {
                self.set(state: .failed)
                print("MiDi 12.12.2016", #file, #line, #function, error)
            }

        }
    }
}
