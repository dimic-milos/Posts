//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import SwiftUI
import Assets

public struct ContentStateView<Source: ContentStateObservable, Content: View>: View {

    // MARK: - Private properties

    @ObservedObject private var source: Source
    private var content: Content

    // MARK: - Init

    public init(
        source: Source,
        @ViewBuilder content: () -> Content
    ) {
        self.source = source
        self.content = content()
    }

    // MARK: - Body

    public var body: some View {
        switch self.source.state {
        case .loading:
            ProgressView()
        case .failed:
            Text(L10n.error.localized)
        case .success:
            self.content
        }
    }
}
