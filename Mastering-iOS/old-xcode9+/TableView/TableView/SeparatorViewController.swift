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

class SeparatorViewController: UIViewController {
   
   let list = ["iMac Pro", "iMac 5K", "Macbook Pro", "iPad Pro", "iPhone X", "Mac mini", "Apple TV", "Apple Watch"]
   
   @IBOutlet weak var listTableView: UITableView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
    
    // 직접 속성 제어 가능
    listTableView.separatorStyle = .singleLine
    listTableView.separatorColor = UIColor.blue
    listTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    if #available(iOS 11.0, *) {
    listTableView.separatorInsetReference = .fromCellEdges
    } else {
        // fallback on earlier ver
    }
   }
}

extension SeparatorViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 100
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      cell.textLabel?.text = list[indexPath.row % list.count]
    if indexPath.row == 1 {
        cell.separatorInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
    } else if indexPath.row == 2 {
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
    }
      return cell
   }
}
























