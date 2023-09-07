//
//  File.swift
//  
//
//  Created by Milos Dimic on 07.09.23.
//

import Foundation

enum Tab {

    case posts
    case favourites

    var navTitle: String {
        switch self {
        case .posts:
            return "Posts"
        case .favourites:
            return "Favourites"
        }
    }
}
