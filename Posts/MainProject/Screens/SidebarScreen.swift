//
//  SidebarScreen.swift
//  Posts
//
//  Created by Milos Dimic on 31.10.23.
//

import Foundation

enum SidebarScreen {

    case main

    var name: String {
        switch self {
        case .main:
            return "Main"
        }
    }
}
