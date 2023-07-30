//
//  Item.swift
//  Improv-Suggestion-App
//
//  Created by This on 09/07/2023.
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
