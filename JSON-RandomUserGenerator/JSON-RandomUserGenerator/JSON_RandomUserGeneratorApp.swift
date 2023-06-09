//
//  JSON_RandomUserGeneratorApp.swift
//  JSON-RandomUserGenerator
//
//  Created by Medunan  on 05/06/23.
//

import SwiftUI

@main
struct JSON_RandomUserGeneratorApp: App {
    let persistanceController = PersistanceController.shared
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainView()
                    .environment(\.managedObjectContext, persistanceController.container.viewContext)
  //                ContentView()
//                FollowersView()
            }
        }
    }
}
