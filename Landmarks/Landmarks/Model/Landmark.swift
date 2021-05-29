//
//  Landmark.swift
//  Landmarks
//
//  Created by 이동규 on 2021/05/29.
//

import Foundation
import SwiftUI  //이미지 타입 사용하기 위해서 라이브러리 가져옴
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    //유저인풋 위한 변수 추가
    var isFavorite: Bool
    
    //1. 이미지 이름 저장하는 프로퍼티 추가
    private var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    //2. 좌표 저장 위한 프로퍼티 추가
    private var coordinates: Coordinates
    //3.
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
