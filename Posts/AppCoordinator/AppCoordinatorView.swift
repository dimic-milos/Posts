//
//  AppCoordinatorView.swift
//  Posts
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import FlowStacks

struct AppCoordinatorView: View {

    // MARK: - Private properties

    @State private var viewModel: AppCoordinatorViewModel

    // MARK: - Init

    init(viewModel: AppCoordinatorViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body

    var body: some View {
        Text("1")
    }
}
