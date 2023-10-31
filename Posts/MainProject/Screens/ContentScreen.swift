//
//  ContentScreen.swift
//  Posts
//
//  Created by Milos Dimic on 31.10.23.
//

import Foundation

enum ContentScreen {

    case combined
    case posts
    case favourites

    var name: String {
        switch self {
        case .combined:
            return "Combined"
        case .posts:
            return "Posts"
        case .favourites:
            return "Favourites"
        }
    }
}
