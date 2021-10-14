//
//  WeatherListTableViewController.swift
//  MVVM_Weather
//
//  Created by 이동규 on 2021/10/14.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // 네비게이션바 큰 타이틀로
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        /* 뷰모델로 이동
        //
        let resource = Resource<WeatherResponse>(url: URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=fa3aa910026722037d99836ade4220dd")!) { data in
            
            return try? JSONDecoder().decode(WeatherResponse.self, from: data)
        }
        Webservice().load(resource: resource) { weatherResponse in
            if let weatherResponse = weatherResponse {
                print(weatherResponse)
            }
        }
         */
    }
    
    // segue 데이터 전달 구현하면서 만든 델리게이트
    func addWeatherDidSave(vm: WeatherViewModel) {
        print(vm)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        cell.textLabel?.text = "Houston"
        cell.detailTextLabel?.text = "55°"
        
        return cell
    }
    
    // segue 데이터 전달과 관련
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewControllerSegue" {
            NSLog("HELLO")
            prepareSegueAddWeatherCityViewController(segue: segue)
        }
    }
    
    //
    func prepareSegueAddWeatherCityViewController(segue: UIStoryboardSegue) {
        
        // segue가 바로 뷰컨트롤러로 가는게 아니라 네비게이션 컨트롤러 통해서 가기때문에
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("Navigation Controller not found.")
        }
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController not found.")
        }
        addWeatherCityVC.delegate = self
    }
}
