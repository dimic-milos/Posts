//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

import Foundation

public struct PostAPIRequestModel: Encodable {

    // MARK: - Private properties

    private let userId: Int

    // MARK: - Init

    public init(userID: Int) {
        self.userId = userID
    }
}
