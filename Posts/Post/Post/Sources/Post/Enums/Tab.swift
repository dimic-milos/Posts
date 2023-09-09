//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import Foundation
import Assets

enum Tab {

    case posts
    case favourites

    var navTitle: String {
        switch self {
        case .posts:
            return L10n.posts.localized
        case .favourites:
            return L10n.favourites.localized
        }
    }
}
