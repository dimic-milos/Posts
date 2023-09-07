//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import LoginAPI

final class LoginCoordinatorViewModel: LoginCoordinatorViewModelProtocol {
    
    // MARK: - Private properties

    @Binding private var coordinatorAction: LoginCoordinatorAction?

    // MARK: - Init

    init(coordinatorAction: Binding<LoginCoordinatorAction?>) {
        self._coordinatorAction = coordinatorAction
    }
}
