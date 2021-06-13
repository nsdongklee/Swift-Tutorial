//
//  testProtocolApp.swift
//  testProtocol
//
//  Created by 이동규 on 2021/05/31.
//

import SwiftUI

@main
struct testProtocolApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
