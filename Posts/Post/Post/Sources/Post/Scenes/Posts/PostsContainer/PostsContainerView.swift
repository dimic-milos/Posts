//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import Assets
import PostAPI

struct PostsContainerView<ViewModel: PostsContainerViewModelProtocol>: View {

    // MARK: - Private properties

    private var viewModel: ViewModel

    @State private var selectedTab = Tab.posts

    // MARK: - Init

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body

    var body: some View {
        self.contentView
            .navigationTitle(self.title)
            .navigationBarBackButtonHidden()
    }
}

// MARK: - Views

private extension PostsContainerView {

    @ViewBuilder
    var contentView: some View {
        switch self.viewModel.useCase {
        case .combined:
            self.combinedView
        case .posts:
            self.posts
        case .favourites:
            self.favourites
        }
    }

    var combinedView: some View {
        TabView(selection: self.$selectedTab) {
            self.posts
            self.favourites
        }
    }

    var posts: some View {
        BasePostsView(viewModel: self.viewModel.allPostsViewModel)
            .tabItem {
                Label(L10n.posts.localized, systemImage: "house")
            }
            .tag(Tab.posts)
    }

    var favourites: some View {
        BasePostsView(viewModel: self.viewModel.favouritePostsViewModel)
            .tabItem {
                Label(L10n.favourites.localized, systemImage: "star")
            }
            .tag(Tab.favourites)
    }
}

// MARK: - Navigation Title

private extension PostsContainerView {

    var title: String {
        switch self.viewModel.useCase {
        case .combined:
            return self.selectedTab.navTitle
        case .posts:
            return Tab.posts.navTitle
        case .favourites:
            return Tab.favourites.navTitle
        }
    }
}
