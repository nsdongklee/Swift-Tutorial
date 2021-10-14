//
//  Constants.swift
//  MVVM_Weather
//
//  Created by 이동규 on 2021/10/14.
//

import Foundation

struct Constants {
    
    struct Urls {
        static func urlForWeatherByCity(city: String) -> URL {
            return URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=fa3aa910026722037d99836ade4220dd&units=imperial")!
        }
    }
}
