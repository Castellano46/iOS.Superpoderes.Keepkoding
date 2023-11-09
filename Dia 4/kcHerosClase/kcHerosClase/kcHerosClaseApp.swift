//
//  kcHerosClaseApp.swift
//  kcHerosClase
//
//  Created by Pedro on 7/11/23.
//

import SwiftUI

@main
struct kcHerosClaseApp: App {
    let persistenceController = PersistenceController.shared   // core data
    
    //View model global
    @StateObject var rootViewModel = RootViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(rootViewModel)
        }
    }
}
