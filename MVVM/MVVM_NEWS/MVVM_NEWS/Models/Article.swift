//
//  Article.swift
//  MVVM_NEWS
//
//  Created by 이동규 on 2021/10/13.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}


struct Article: Decodable {
    let title: String
    let description: String
}
