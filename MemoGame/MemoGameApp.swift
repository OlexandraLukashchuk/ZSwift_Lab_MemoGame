//
//  MemoGameApp.swift
//  MemoGame
//
//  Created by student on 12/11/2024.
//

import SwiftUI

@main
struct MemoGameApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
