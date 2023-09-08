//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

import Foundation

public extension Encodable {

    func parameters<T>() -> [String: T] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        guard let parameters = try? JSONSerialization.jsonObject(
            with: data
        ) as? [String: T] else {
            return [:]
        }
        return parameters
    }
}
