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
    //모델데이터에서 가져오기
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
//            MapView() //맵뷰로 보인다.
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)  
            ContentView()
                .environmentObject(modelData)
        }
    }
}
