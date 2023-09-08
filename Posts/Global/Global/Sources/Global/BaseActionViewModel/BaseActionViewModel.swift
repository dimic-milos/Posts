//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI

open class BaseActionViewModel<Action> {

    // MARK: - Public properties

    @ObservedObject public var actionViewModel: ActionViewModel<Action> = .init()

    // MARK: - Init
    
    public init() {}
}
