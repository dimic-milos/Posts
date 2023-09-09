//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import UI

struct CommentsView<ViewModel: CommentsViewModelProtocol>: View {
    
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
        .onFirstAppear {
            self.viewModel.load()
        }
    }
}

// MARK: - Views

private extension CommentsView {

    var content: some View {
        VStack(spacing: 16) {
            self.postView
            self.commentsView
        }
        .padding()
    }

    var postView: some View {
        PostView(
            config: self.viewModel.config,
            useCase: .favourite,
            onTextTap: { _ in },
            onStarTap: self.viewModel.handleDidTapstar(config:)
        )
    }

    var commentsView: some View {
        List(self.viewModel.comments, id: \.self) {
            CommentView(comment: $0)
        }
    }
}
