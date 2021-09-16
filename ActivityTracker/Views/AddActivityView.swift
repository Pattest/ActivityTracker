//
//  AddActivityView.swift
//  ActivityTracker
//
//  Created by Baptiste Cadoux on 16/09/2021.
//

import SwiftUI

struct AddActivityView: View {

    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var activities: Activities

    @State private var name = ""
    @State private var description = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationBarTitle(Text("Add activity"))
            .navigationBarItems(
                trailing: Button("Save") {
                    saveItem()
                }
            )
        }
    }

    func saveItem() {
        let activity = ActivityItem(name: name,
                                    description: description)
        activities.items.append(activity)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        let activities = Activities()
        AddActivityView(activities: activities)
    }
}
