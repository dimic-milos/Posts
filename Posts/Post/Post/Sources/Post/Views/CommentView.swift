//
//  File.swift
//  
//
//  Created by Milos Dimic on 09.09.23.
//

import SwiftUI
import Models

struct CommentView: View {

    // MARK: - Public properties

    let comment: CommentModel

    // MARK: - Body

    var body: some View {
        VStack(spacing: 16) {
            Text(self.comment.email).bold()
            Text(self.comment.title).bold()
            Text(self.comment.comment)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
