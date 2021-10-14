//
//  AddWeatherCityViewController.swift
//  MVVM_Weather
//
//  Created by 이동규 on 2021/10/14.
//

import Foundation
import UIKit

// 데이터 넘기기위한
protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    @IBOutlet weak var cityNameTextField: UITextField!
    
    private var addWeatherVM = AddWeatherViewModel()
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed() {
    /* 위처럼 로직 작성하다가 뷰모델로 들어감
        if let cityName = self.cityNameTextField.text {
            let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=fa3aa910026722037d99836ade4220dd")
            
            // 뷰모델 정의하기 전엔 제너릭에 Any로 테스팅했음.
            let weatherSource = Resource<Any>(url: weatherURL) { data in
                return data
            }
            Webservice().load(resource: weatherSource) { result in
//
            }
        }
     */
        // 뷰모델에 적용한 로직과 끌어와서 선언한 인스턴스 활용
        if let city = self.cityNameTextField.text {
            NSLog("hererere in1")
            self.addWeatherVM.addWeather(for: city) { (vm) in
                NSLog("hererere in2")
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true, completion: nil)
            }
        }
        print("hererere")
        
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
