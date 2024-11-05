//
//  ZSwift_Lab2App.swift
//  ZSwift_Lab2
//
//  Created by student on 22/10/2024.
//

import SwiftUI

@main
struct ZSwift_Lab2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
