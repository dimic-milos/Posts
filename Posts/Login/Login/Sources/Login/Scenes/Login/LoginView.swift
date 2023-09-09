//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

import SwiftUI
import UI
import Assets

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
        TextField(L10n.loginPrompt.localized, text: self.$text)
            .padding()
            .border(.black)
            .keyboardType(.numberPad)
            .focused(self.$isFocused)
    }

    var loginButtonView: some View {
        Button(L10n.login.localized) {
            Int(self.text).map(self.viewModel.login(userID:))
        }
        .bold()
    }
}
