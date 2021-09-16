//
//  Activities.swift
//  ActivityTracker
//
//  Created by Baptiste Cadoux on 14/09/2021.
//

import SwiftUI

class Activities: ObservableObject {

    @Published var items = [ActivityItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.setValue(encoded, forKey: "Items")
            }
        }
    }

    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ActivityItem].self, from: items) {
                self.items = decoded
                return
            }
        }

        self.items = []
    }
}
