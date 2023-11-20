//
//  kcHerosClaseApp.swift
//  kcHerosClase
//
//  Created by Pedro on 7/11/23.
//

import SwiftUI

@main
struct kcHerosClaseApp: App {
    let persistenceController = PersistenceController.shared //Core Data
    
    //ViewMOdel global
    @StateObject var rootViewModel = RootViewModel()
    

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(rootViewModel)
        }
    }
}
