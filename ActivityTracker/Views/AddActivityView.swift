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

    @State private var showAlert = false
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
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Name and description are required"))
            }
        }
    }

    func saveItem() {
        if name.isEmpty || description.isEmpty {
            self.showAlert = true
            return
        }

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
