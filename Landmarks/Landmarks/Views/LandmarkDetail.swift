//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 이동규 on 2021/05/29.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    
    var body: some View {
        ScrollView {
            //맵뷰파일에 구조체 불러오기
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            //Circle뷰 파일에서 구조체 불러오기
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
//                Text("Turtle Rock")
                Text(landmark.name)
                    .font(.title)
                HStack {
//                    Text("Joshua Tree National Park")
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
//                    Text("California")
                    Text(landmark.state)
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
//                Text("About Turtle Rock")
                Text("About \(landmark.name)")
                    .font(.title2)
//                Text("Descriptive text goes here.")
                Text(landmark.description)
            }
            .padding()
//            Spacer()    //위에 올려주고 아래 공간 만들어줌
        }
        // 위 공간에 디테일 정보 타이틀 생성
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
