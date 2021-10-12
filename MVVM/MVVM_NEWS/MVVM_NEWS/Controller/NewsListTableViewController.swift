//
//  NewsListTableViewController.swift
//  MVVM_NEWS
//
//  Created by 이동규 on 2021/10/12.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    

    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
