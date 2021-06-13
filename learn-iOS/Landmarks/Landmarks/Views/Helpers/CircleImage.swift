//
//  CircleImage.swift
//  Landmarks
//
//  Created by 이동규 on 2021/05/29.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
//        Image("turtlerock")   //하드코딩된건 없애기
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
