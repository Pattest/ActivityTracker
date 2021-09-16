//
//  ContentView.swift
//  ActivityTracker
//
//  Created by Baptiste Cadoux on 14/09/2021.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var activities = Activities()

    @State private var showAddActivity = false

    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items, id: \.id) { activity in
                    NavigationLink(destination: ActivityView(activity: activity)) {
                        HStack {
                            Text(activity.name)
                            Spacer()
                            Text("\(activity.count)")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("ActivityTracker")
            .navigationBarItems(
                trailing: Button(action: {
                    showAddActivity = true
                }) {
                    Text("Add activity")
                })
            .sheet(isPresented: $showAddActivity) {
                AddActivityView(activities: activities)
            }
        }
    }

    func removeItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
