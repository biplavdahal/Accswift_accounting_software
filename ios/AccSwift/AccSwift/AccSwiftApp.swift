//
//  AccSwiftApp.swift
//  AccSwift
//
//  Created by Ashim on 17/06/2022.
//

import SwiftUI

@main
struct AccSwiftApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
