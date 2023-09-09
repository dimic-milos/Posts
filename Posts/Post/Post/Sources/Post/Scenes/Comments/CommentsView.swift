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
        VStack(spacing: 16) {
            PostView(
                config: self.viewModel.config,
                onTap: self.viewModel.handle(action:)
            )
            ContentStateView(source: self.viewModel) {
                VStack {
                    List(self.viewModel.comments, id: \.self) {
                        CommentView(comment: $0)
                    }
                }
            }
        }
        .padding()
        .onFirstAppear {
            self.viewModel.load()
        }
    }
}
