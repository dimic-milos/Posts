//
//  AppCoordinatorViewModel.swift
//  Posts
//
//  Created by Milos Dimic on 30.10.23.
//

import SwiftUI

@Observable final class AppCoordinatorViewModel {

    var sidebar: SidebarScreen?
    let sidebars: [SidebarScreen] = [
        .main
    ]

    var content: ContentScreen?
    let contents: [ContentScreen] = [
        .tab,
        .posts,
        .favourites
    ]
}

extension AppCoordinatorViewModel {

    enum SidebarScreen: String {

        case main
    }

    enum ContentScreen: String {
        
        case tab
        case posts
        case favourites
    }
}
