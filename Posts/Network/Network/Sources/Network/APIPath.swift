//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

import Foundation

import Foundation

public enum APIPath: Equatable {

    case posts
    case comments(postID: Int)
}

extension APIPath {

    var path: String {
        switch self {
        case .posts:
            return "/posts"
        case .comments(let postID):
            return "/posts/\(postID)/comments"
        }
    }

    var successStatusCodeRange: Range<Int> {
        200..<300
    }
}
