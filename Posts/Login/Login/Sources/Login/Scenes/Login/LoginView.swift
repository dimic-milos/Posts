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
        self.content
            .onFirstAppear {
                self.isFocused = true
            }
    }
}

// MARK: - Views

private extension LoginView {

    var content: some View {
        VStack(spacing: 48) {
            self.textFieldView
            self.loginButtonView
        }
        .padding()
    }

    var textFieldView: some View {
        TextField("Please enter user ID", text: self.$text)
            .padding()
            .border(.black)
            .keyboardType(.numberPad)
            .focused(self.$isFocused)
    }

    var loginButtonView: some View {
        Button("Login") {
            Int(self.text).map(self.viewModel.login(userID:))
        }
        .bold()
    }
}
