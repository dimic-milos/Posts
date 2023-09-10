//
//  PostsApp.swift
//  Posts
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI

@main
struct PostsApp: App {

    // MARK: - Private properties

    private let viewModel = AppCoordinatorViewModel()

    // MARK: - Init

    init() {
        DependencyRegistrationHelper.register()
    }

    // MARK: - Body

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(viewModel: self.viewModel)
        }
    }
}
