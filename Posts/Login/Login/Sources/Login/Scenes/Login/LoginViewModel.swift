//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

import Foundation
import Global

protocol LoginViewModelProtocol {

    func login(userID: Int)
}

final class LoginViewModel: 
    BaseActionViewModel<LoginViewModel.Action>,
    LoginViewModelProtocol
{

    // MARK: - API

    func login(userID: Int) {
        self.actionViewModel.action = .didTapLogin(userID: userID)
    }
}

extension LoginViewModel {

    enum Action {

        case didTapLogin(userID: Int)
    }
}
