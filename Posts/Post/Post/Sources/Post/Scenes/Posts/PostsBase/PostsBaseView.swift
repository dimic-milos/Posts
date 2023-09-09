//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import UI

struct PostsBaseView<ViewModel: PostsBaseViewModelProtocol>: View {

    // MARK: - Private properties

    @StateObject private var viewModel: ViewModel

    // MARK: - Init

    init(viewModel: ViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }

    // MARK: - Body

    var body: some View {
        ContentStateView(source: self.viewModel) {
            self.content
        }
        .onAppear {
            self.viewModel.load()
        }
    }
}

// MARK: - Views

private extension PostsBaseView {

    @ViewBuilder var content: some View {
        if self.viewModel.postConfigs.isEmpty {
            Text("No Posts Yet")
        } else {
            List(self.viewModel.postConfigs, id: \.self) {
                PostView(config: $0, onTap: self.viewModel.handle(action:))
            }
        }
    }
}
