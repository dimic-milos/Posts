//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import Global

public extension View {

    func onFirstAppear(_ onFirstAppear: @escaping VoidCompletion) -> some View {
        ModifiedContent(
            content: self,
            modifier: FirstAppearModifier(onFirstAppear: onFirstAppear)
        )
    }
}

public struct FirstAppearModifier: ViewModifier {

    // MARK: - Private properties

    @State private var isFirstAppear = true

    private var onFirstAppear: VoidCompletion

    // MARK: - Init

    public init(onFirstAppear: @escaping VoidCompletion) {
        self.onFirstAppear = onFirstAppear
    }

    // MARK: - Body

    public func body(content: Content) -> some View {
        content
            .onAppear { self.handleAppear() }
    }

    // MARK: - Helpers

    private func handleAppear() {
        guard self.isFirstAppear else {
            return
        }
        self.onFirstAppear()
        self.isFirstAppear = false
    }
}

