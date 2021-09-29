//
//  ListViewController.swift
//  TableViewCellHeightSample
//
//  Created by 이동규 on 2021/09/29.
//

import Foundation
import UIKit
class ListViewController: UITableViewController {
    // 테이블 뷰의 셀 리스트 배열
    var list = [String]()
    
    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "목록 입력",
                                      message: "추가될 글을 작성해주세요.",
                                      preferredStyle: .alert)
        alert.addTextField { (tf) in
            tf.placeholder = "내용을 입력하세요."
        }
        let ok = UIAlertAction(title: "OK",
                               style: .default) { (_) in
            if let title = alert.textFields?[0].text {
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        let cancel = UIAlertAction(title: "Cancel",
                                   style: .cancel,
                                   handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        self.present(alert, animated: false, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        // 추가. 셀의 기본 텍스트 레비을 행 수 제한을 없앤다. 기본값은 1
        cell.textLabel?.numberOfLines = 0
        
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    /* 셀프사이징셀 쓰면 이거 필요없음
    // 높이 커스텀 로직 추가
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = self.list[indexPath.row]
        let height = CGFloat(60 + (row.count / 30) * 20)
        return height
    }
     */
    
    // 셀프사이징 셀
    override func viewWillAppear(_ animated: Bool) {
        NSLog("viewWillAppear 호출 타이밍")
        self.tableView.estimatedRowHeight = 50  // 대충 높이 값 정함
        self.tableView.rowHeight = UITableView.automaticDimension
    }
}
