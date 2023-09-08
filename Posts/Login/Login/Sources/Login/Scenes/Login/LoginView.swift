//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

import SwiftUI
import UI

struct LoginView<ViewModel: LoginViewModelProtocol>: View {

    // MARK: - Private properties

    let viewModel: LoginViewModelProtocol

    @State private var text = ""
    @FocusState private var isFocused

    // MARK: - Init

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body

    var body: some View {
        VStack {
            TextField("Please enter user ID", text: self.$text)
                .keyboardType(.numberPad)
                .focused(self.$isFocused)
            Button("Login") {
                Int(self.text).map(self.viewModel.login(userID:))
            }
        }
        .onFirstAppear {
            self.isFocused = true
        }
    }
}
