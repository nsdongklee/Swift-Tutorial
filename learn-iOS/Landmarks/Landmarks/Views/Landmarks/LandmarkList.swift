//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 이동규 on 2021/05/29.
//

import SwiftUI

struct LandmarkList: View {
    //모델 데이터 가져오기
    @EnvironmentObject var modelData: ModelData
    
    // 유저인풋관련 변수 추가
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
//        landmarks.filter { landmark in
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    //
    var body: some View {
//        List {
//            하드코딩 하지말기
//            LandmarkRow(landmark: landmarks[0])
//            LandmarkRow(landmark: landmarks[1])
//        }
        // Identifiable 프로토콜을 채택하면 idx 생략가능
        NavigationView {
            //기존
//            List(filteredLandmarks) { landmark in
//                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
//                LandmarkRow(landmark: landmark)
//                }
//            }
//            .navigationTitle("Landmarks")
            
            //토글옵션 추가
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
//        //여러 기기에 동시 프리뷰 할 수 있음
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
//                    LandmarkList()
//                        .previewDevice(PreviewDevice(rawValue: deviceName))
//                        .previewDisplayName(deviceName)
//                }
    }
}
