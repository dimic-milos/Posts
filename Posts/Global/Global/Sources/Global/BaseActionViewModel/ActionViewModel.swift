//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI

public final class ActionViewModel<Action>: ObservableObject {

    // MARK: - Public properties

    @Published public var action: Action?
}
