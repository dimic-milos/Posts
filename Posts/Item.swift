//
//  Item.swift
//  Posts
//
//  Created by Milos Dimic on 07.09.23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
