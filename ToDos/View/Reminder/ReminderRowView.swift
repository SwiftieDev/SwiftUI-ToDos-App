//
//  ReminderRowView.swift
//  ToDos
//
//  Created by SwiftieDev on 03/02/2024.
//

import SwiftUI
import SwiftData

struct ReminderRowView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var reminder: Reminder
    
    var body: some View {
        HStack {
            Button {
                reminder.isCompleted.toggle()
            } label: {
                if reminder.isCompleted {
                    filledReminderLabel
                } else {
                    emptyReminderLabel
                }
            }
            .frame(width: 20, height: 20)
            .buttonStyle(.plain)
            
            TextField(reminder.name, text: $reminder.name)
                .foregroundColor(reminder.isCompleted ? .secondary : .primary)
        }
    }
    
    var filledReminderLabel: some View {
        Circle()
            .stroke(.primary, lineWidth: 2)
            .overlay(alignment: .center) {
                GeometryReader { geo in
                    VStack {
                        Circle()
                            .fill(.primary)
                            .frame(width: geo.size.width*0.7, height: geo.size.height*0.7, alignment: .center)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
    }
    
    var emptyReminderLabel: some View {
        Circle()
            .stroke(.secondary)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Reminder.self, configurations: config)
        let example = Reminder(name: "Reminder Example", isCompleted: false)
        
        return ReminderRowView(reminder: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
