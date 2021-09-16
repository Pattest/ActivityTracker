//
//  ContentView.swift
//  ActivityTracker
//
//  Created by Baptiste Cadoux on 14/09/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddActivity = false

    @ObservedObject var activities = Activities()

    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { activity in
                    NavigationLink(destination: ActivityView()) {
                        HStack {
                            Text(activity.name)
                            Text("\(activity.count)")
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }

            Button(action: {
                self.showingAddActivity = true
            }) {
                Text("Add activity")
            }

            .navigationBarTitle(Text("ActivityTracker"))
            .sheet(isPresented: $showingAddActivity) {
                AddActivityView(activities: self.activities)
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
