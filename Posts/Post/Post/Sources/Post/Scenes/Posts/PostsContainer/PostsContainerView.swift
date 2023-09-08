//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI

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
        PostsBaseView(viewModel: self.viewModel.allPostsViewModel)
            .tabItem {
                Label("Posts", systemImage: "house")
            }
            .tag(Tab.posts)
    }

    var favourites: some View {
        PostsBaseView(viewModel: self.viewModel.favouritePostsViewModel)
            .tabItem {
                Label("Fav", systemImage: "star")
            }
            .tag(Tab.favourites)
    }
}
