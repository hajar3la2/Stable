//
//  StableApp.swift
//  Stable Watch App
//
//  Created by Hajar on 1/8/23.
//

import SwiftUI

@main
struct Stable_Watch_AppApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
