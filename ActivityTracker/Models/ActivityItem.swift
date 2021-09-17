//
//  ActivityItem.swift
//  ActivityTracker
//
//  Created by Baptiste Cadoux on 14/09/2021.
//

import SwiftUI

class ActivityItem: ObservableObject, Identifiable, Codable {
    var name: String
    var description: String
    @Published var count: Int = 0

    init(name: String, description: String) {
        self.name = name
        self.description = description
    }

    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case name
        case description
        case count
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        count = try container.decode(Int.self, forKey: .count)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(count, forKey: .count)
    }

}
