//
//  Reminder.swift
//  ToDos
//
//  Created by SwiftieDev on 03/02/2024.
//

import Foundation
import SwiftData

@Model
final class Reminder {
    var name: String
    var isCompleted = false
    
    init(name: String, isCompleted: Bool = false) {
        self.name = name
        self.isCompleted = isCompleted
    }
}
