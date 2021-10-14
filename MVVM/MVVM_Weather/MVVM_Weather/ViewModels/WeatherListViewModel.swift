//
//  WeatherViewModel.swift
//  MVVM_Weather
//
//  Created by 이동규 on 2021/10/14.
//

import Foundation

class WeatherListViewModel {
    
}

class WeatherViewModel {
    
    let weather: WeatherResponse
    
    init(weather: WeatherResponse) {
        self.weather = weather
    }
    
    var city: String {
        return self.weather.name
    }
    
    var temperature: Double {
        return self.weather.main.temperature
    }
}
