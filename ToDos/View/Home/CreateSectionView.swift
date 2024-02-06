//
//  CreateSectionView.swift
//  ToDos
//
//  Created by SwiftieDev on 03/02/2024.
//

import SwiftUI
import SwiftData

struct CreateSectionView: View {
    @Bindable var reminderList: ReminderList
    
    var body: some View {
        Form {
            TextField("Name", text: $reminderList.name)
            
            Section("Icon") {
                Picker("Icon", selection: $reminderList.iconName) {
                    Image(systemName: "house").tag("house")
                    Image(systemName: "heart").tag("heart")
                    Image(systemName: "calendar").tag("calendar")
                    Image(systemName: "flag.fill").tag("flag.fill")
                    Image(systemName: "sun.max.fill").tag("sun.max.fill")
                    Image(systemName: "graduationcap").tag("graduationcap")
                    Image(systemName: "exclamationmark.3").tag("exclamationmark.3")
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle("Add Segment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CreateSectionView(reminderList: ReminderList())
}
