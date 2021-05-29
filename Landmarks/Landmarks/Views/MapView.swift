//
//  MapView.swift
//  Landmarks
//
//  Created by 이동규 on 2021/05/29.
//

import SwiftUI
import MapKit       // 맵킷 인클루드했슴

struct MapView: View {
    var coordinate: CLLocationCoordinate2D  // 하드코딩없애기 위해서 바꾸는중
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    var body: some View {
        Map(coordinateRegion: $region)
    }
    
    //좌표값에 기반한 위치를 추가하는 메소드 추가
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
