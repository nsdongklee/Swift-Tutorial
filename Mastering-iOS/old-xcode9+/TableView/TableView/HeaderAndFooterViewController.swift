//
//  Copyright (c) 2018 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

class SectionHeaderAndFooterViewController: UIViewController {
   
   @IBOutlet weak var listTableView: UITableView!
   
   let list = Region.generateData()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
    // Nib 파일 없으면 헤더 등록을 클래스로 해야함
    listTableView.register(UITableViewHeaderFooterView.self, forCellReuseIdentifier: "header")
   }
}


extension SectionHeaderAndFooterViewController: UITableViewDataSource {
   func numberOfSections(in tableView: UITableView) -> Int {
      return list.count
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return list[section].countries.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      let target = list[indexPath.section].countries[indexPath.row]
      cell.textLabel?.text = target
      
      return cell
   }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        // 타이틀 분류별로 헤더가 상단에 고정되며 스크롤 된다.
//        return list[section].title
//    }
    
}

extension SectionHeaderAndFooterViewController: UITableViewDelegate {
    
    // 커스텀 헤더를 선언
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableCell(withIdentifier: "header")
        headerView?.textLabel?.text = list[section].title
        headerView?.detailTextLabel?.text = "Lorem Ipsum"
        
        //headerView?.backgroundColor = UIColor.darkGray
        
        // 헤더의 색깔을 커스텀 하기위한 인스턴스
        let v = UIView(frame: .zero)
        v.backgroundColor = UIColor.darkGray
        v.isUserInteractionEnabled = false
        headerView?.backgroundView = v
        
        
        // 컬러와 정렬이 적용되지 않음을 알 수 있다.
        headerView?.textLabel?.textColor = UIColor.white
        headerView?.textLabel?.textAlignment = .center
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
//            if headerView.backgroundView == nil {
//                let v = UIView(frame: .zero)
//                v.backgroundColor = UIColor.darkGray
//                v.isUserInteractionEnabled = false
//                headerView.backgroundView = v
            headerView.backgroundView?.backgroundColor = UIColor.darkGray
        
            headerView.textLabel?.textColor = UIColor.white
            headerView.textLabel?.textAlignment = .center
        }
    }
}














