//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

import Foundation
import SwiftData

@Model
final public class PostDBModel {

    // MARK: - Public properties

    public let id: Int
    public let title: String
    public let body: String

    // MARK: - Init
    
    init(id: Int, title: String, body: String) {
        self.title = title
        self.body = body
        self.id = id
    }
}
