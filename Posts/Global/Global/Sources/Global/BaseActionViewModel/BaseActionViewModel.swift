//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI

open class BaseActionViewModel<Action> {

    // MARK: - Public properties

    @State public var actionViewModel: ActionViewModel<Action> = .init()
}
