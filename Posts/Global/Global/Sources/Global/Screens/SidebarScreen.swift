//
//  SidebarScreen.swift
//  Posts
//
//  Created by Milos Dimic on 31.10.23.
//

import Foundation

public enum SidebarScreen {

    case main

    public var name: String {
        switch self {
        case .main:
            return "Main"
        }
    }
}
