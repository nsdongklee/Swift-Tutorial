//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 이동규 on 2021/05/29.
//

import SwiftUI

@main   // AppDelegate의 메인 엔트리포인트
struct LandmarksApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            MapView()
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
