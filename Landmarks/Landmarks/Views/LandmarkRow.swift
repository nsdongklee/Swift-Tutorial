//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 이동규 on 2021/05/29.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            
            //유저인풋 관련 함수 추가
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
//        LandmarkRow(landmark: landmarks[0])
//            .previewLayout(.fixed(width: 300, height: 70))
//        LandmarkRow(landmark: landmarks[1])
//            .previewLayout(.fixed(width: 300, height: 70))
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
