//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import LoginAPI

struct LoginCoordinatorView: LoginCoordinatorViewProtocol {
    
    // MARK: - Private properties

    @State private var viewModel: LoginCoordinatorViewModel
    
    // MARK: - Init

    init(viewModel: LoginCoordinatorViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body
    
    var body: some View {
        Text("LoginCoordinatorView")
    }
}
