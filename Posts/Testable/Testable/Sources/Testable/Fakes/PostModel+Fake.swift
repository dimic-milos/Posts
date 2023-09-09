//
//  File.swift
//  
//
//  Created by Milos Dimic on 09.09.23.
//

import Models

public extension PostModel {

    static func fake(id: Int = 1) -> Self {
        .init(id: id, title: "title", body: "body")
    }
}
