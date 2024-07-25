//
//  TaskDOApp.swift
//  TaskDO
//
//  Created by Satshree Shrestha on 7/24/24.
//

import FirebaseCore
import SwiftUI

@main
struct TaskDOApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
