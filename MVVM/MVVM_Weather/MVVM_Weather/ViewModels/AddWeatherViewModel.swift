//
//  AddWeatherViewModel.swift
//  MVVM_Weather
//
//  Created by 이동규 on 2021/10/14.
//

import Foundation

class AddWeatherViewModel {
    
    func addWeather(for city: String, completion: @escaping (WeatherViewModel) -> Void) {
        print("in func")
        let weatherURL = Constants.Urls.urlForWeatherByCity(city: city)
        print(weatherURL)
        let weatherResource = Resource<WeatherResponse>(url: weatherURL) { data in
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse
        }
        print("wea.res ", weatherResource)
        Webservice().load(resource: weatherResource) { (result) in
            print("hereload")
            if let weatherResource = result {
                print("herevm")
                let vm = WeatherViewModel(weather: weatherResource)
                completion(vm)
            } else if result == nil {
                print("no thanks")
            }
        }
    }
}
