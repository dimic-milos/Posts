//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI

public protocol ContentStateObservable: ObservableObject {

    var state: ContentState { get set }

    func set(state: ContentState)
}

public extension ContentStateObservable {

    func set(state: ContentState) {
        Task { @MainActor [weak self] in
            self?.state = state
        }
    }
}
