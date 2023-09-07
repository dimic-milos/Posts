//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI

@Observable public protocol ContentStateObservable: AnyObject {

    var state: ContentState { get set }

    func set(state: ContentState, delay: TimeInterval?)
}

public extension ContentStateObservable {

    func set(state: ContentState) {
        Task { @MainActor [weak self] in
            self?.state = state
        }
    }
}
