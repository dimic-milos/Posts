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

    private var viewModel: ViewModel

    // MARK: - Init

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body

    var body: some View {
        ContentStateView(source: self.viewModel) {
            self.content
        }
        .onFirstAppear {
            self.viewModel.load()
        }
    }
}

// MARK: - Views

private extension PostsBaseView {

    var content: some View {
        Text("PostsBaseView")
    }
}
