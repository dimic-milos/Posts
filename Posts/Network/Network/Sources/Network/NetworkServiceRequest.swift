//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

import Foundation

public struct NetworkServiceRequest: Equatable, Hashable {

    // MARK: - Public properties

    let path: APIPath
    let method: HTTPMethod
    let parameters: [String: String]

    // MARK: - Init

    public init(
        path: APIPath,
        method: HTTPMethod,
        parameters: [String: String] = [:]
    ) {
        self.path = path
        self.method = method
        self.parameters = parameters
    }
}
