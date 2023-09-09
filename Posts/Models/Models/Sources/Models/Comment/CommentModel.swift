//
//  File.swift
//  
//
//  Created by Milos Dimic on 09.09.23.
//

import Foundation

public struct CommentModel: Decodable, Hashable {

    // MARK: - Public properties

    public let email: String
    public let title: String
    public let comment: String

    // MARK: - Init

    init(email: String, title: String, comment: String) {
        self.email = email
        self.title = title
        self.comment = comment
    }
}
