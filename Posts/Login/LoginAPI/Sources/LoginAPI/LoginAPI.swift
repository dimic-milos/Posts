import SwiftUI

// MARK: - Coordinator

public protocol LoginCoordinatorViewModelProtocol {}
public protocol LoginCoordinatorViewProtocol: View {}

// MARK: - Actions

public enum LoginCoordinatorAction: Equatable {

    case didLogin(userID: Int)
}
