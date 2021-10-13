//
//  NewsListTableViewController.swift
//  MVVM_NEWS
//
//  Created by 이동규 on 2021/10/12.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    

    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        //Service 폴더에서 정의한 로직 써보기
        let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=451b73ec6b09427cbf6144a18de95732")!
        Webservice().getArticles(url: url) { articles in
            
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
            }
            // 데이터 로드 후 UI 리로딩하기
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // 뷰모델에서 익스텐션에 정의했던 뷰모델 유틸 함수들 오버라이딩
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found.")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        cell.titleLable.text = articleVM.title
        cell.descriptionLable.text = articleVM.description
        
        return cell
    }
}
