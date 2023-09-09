//
//  File.swift
//  
//
//  Created by Milos Dimic on 09.09.23.
//

import Foundation

public struct CommentAPIModel: Decodable {

    // MARK: - Public properties

    public let name: String
    public let email: String
    public let body: String

    // MARK: - Init

    init(name: String, email: String, body: String) {
        self.name = name
        self.email = email
        self.body = body
    }
}
