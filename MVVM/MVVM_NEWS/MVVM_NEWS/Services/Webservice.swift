//
//  Webservice.swift
//  MVVM_NEWS
//
//  Created by 이동규 on 2021/10/13.
//

import Foundation

class Webservice {
    
    // News API 에서 리퀘스트로 데이터 요청, 핸들링
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
        
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                print(articleList?.articles)
            }
        }.resume()
    }
}
