//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import Foundation

final class AllPostsViewModel: PostsBaseViewModel {

    override func load() {
        print("MiDi 12.12.2016", #file, #line, #function)

        Task {
            do {
                let posts = try await self.manager.fetchPosts(userID: 1)
                print("MiDi 12.12.2016", #file, #line, #function, posts)
            } catch {
                print("MiDi 12.12.2016", #file, #line, #function, error)
            }

        }

    }

    override func didTapStar() {
        print("MiDi 12.12.2016", #file, #line, #function)
    }
}
