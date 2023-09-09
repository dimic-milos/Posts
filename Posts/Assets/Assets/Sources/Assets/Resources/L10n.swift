//
//  File.swift
//  
//
//  Created by Milos Dimic on 09.09.23.
//

import Foundation

public enum L10n: String {

    case login
    case error
    case posts
    case favourites
    case comments

    case loginPrompt
    case noPosts

}

public extension L10n {

    // MARK: - API

    var localized: String {
        Self.localizedString(self.rawValue)
    }

    var accessibilityIdentifier: String {
        self.rawValue
    }

    // MARK: - Helpers

    private static func localizedString(_ key: String) -> String {
        NSLocalizedString(key, bundle: .module, comment: "")
    }
}
