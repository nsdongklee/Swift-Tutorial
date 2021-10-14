//
//  WeatherResponse.swift
//  MVVM_Weather
//
//  Created by 이동규 on 2021/10/14.
//

import Foundation

// Read-Only 전용이라 Decodable 프로토콜 채택
struct WeatherResponse: Decodable {
    let name: String
    let main: Weather
}

struct Weather: Decodable {
    let temperature: Double
    let humidity: Double
}
