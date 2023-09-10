//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import Assets

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
        TabView(selection: self.$selectedTab) {
            self.posts
            self.favourites
        }
        .navigationTitle(self.selectedTab.navTitle)
        .navigationBarBackButtonHidden()
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
