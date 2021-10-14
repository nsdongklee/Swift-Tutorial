//
//  Webservice.swift
//  MVVM_Weather
//
//  Created by 이동규 on 2021/10/14.
//

import Foundation

struct Resource<T> {
    // url 을 담는 프로퍼티
    let url: URL
    
    // 네트워크 콜로 받은 데이터를 원하는 적절한 데이터 타입으로 변경
    let parse: (Data) -> T?
}

final class Webservice {
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            // 보통 데이터를 불러들이면 뷰도 고칠텐데 completion을 비동기처리한다.
            // 네트워크 콜을 하게되면 백그라운드 쓰레드에서 할텐데 그렇게 되면 UI 업데이트할 때 몇 이슈를 겪게된다.
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
            
        }.resume()
    }
}
