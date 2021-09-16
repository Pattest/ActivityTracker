//
//  ActivityItem.swift
//  ActivityTracker
//
//  Created by Baptiste Cadoux on 14/09/2021.
//

import SwiftUI

struct ActivityItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
    var count: Int

    init(name: String, description: String) {
        self.name = name
        self.description = description
        self.count = 0
    }
}
