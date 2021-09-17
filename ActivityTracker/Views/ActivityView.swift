//
//  ActivityView.swift
//  ActivityTracker
//
//  Created by Baptiste Cadoux on 16/09/2021.
//

import SwiftUI

struct ActivityView: View {

    var activities: Activities
    @ObservedObject var activity: ActivityItem

    var body: some View {
        VStack(alignment: .leading) {
            Text(activity.description)
                .foregroundColor(.secondary)
            Divider()
            Stepper("Times completed: \(activity.count)",
                    value: $activity.count)
            Spacer()
        }
        .onDisappear(perform: {
            activities.saveItems()
        })
        .navigationBarTitle(Text(activity.name))
        .padding()
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        let activity = ActivityItem(name: "Name",
                                    description: "Description")
        ActivityView(activities: Activities(),
                     activity: activity)
    }
}
