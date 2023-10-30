//
//  AppCoordinatorView.swift
//  Posts
//
//  Created by Milos Dimic on 30.10.23.
//

import SwiftUI

struct AppCoordinatorView: View {

    // MARK: - Private properties

    @State private var viewModel: AppCoordinatorViewModel

    // MARK: - Init

    init(viewModel: AppCoordinatorViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body
    
    var body: some View {
        NavigationSplitView(
            sidebar: { self.sidebarView },
            content: { self.contentView },
            detail: { self.detailView }
        )
    }
}

// MARK: - Views

private extension AppCoordinatorView {

    var sidebarView: some View {
        List(selection: self.$viewModel.sidebar) {
            ForEach(self.viewModel.sidebars, id: \.self) {
                Text($0.rawValue)
            }
        }
    }

    var contentView: some View {
        List(selection: self.$viewModel.content) {
            ForEach(self.viewModel.contents, id: \.self) {
                Text($0.rawValue)
            }
        }
    }

    var detailView: some View {
        if let content = self.viewModel.content {
            switch content {
            case .tab:
                Text("tab")
            case .posts:
                Text("posts")
            case .favourites:
                Text("fav")
            }
        } else {
            Text("N/A")
        }
    }
}
