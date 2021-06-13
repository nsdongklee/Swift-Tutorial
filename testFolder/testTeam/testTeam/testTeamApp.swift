//
//  testTeamApp.swift
//  testTeam
//
//  Created by 이동규 on 2021/05/30.
//

import SwiftUI

@main
struct testTeamApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
