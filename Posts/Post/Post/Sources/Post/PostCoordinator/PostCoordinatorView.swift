//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import PostAPI

struct PostCoordinatorView: PostCoordinatorViewProtocol {

    // MARK: - Private properties

    @State private var viewModel: PostCoordinatorViewModel

    // MARK: - Init

    init(viewModel: PostCoordinatorViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body

    var body: some View {
        Text("PostCoordinatorView")
    }
}
