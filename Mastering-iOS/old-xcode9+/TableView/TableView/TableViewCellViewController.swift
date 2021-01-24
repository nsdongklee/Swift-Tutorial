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

class TableViewCellViewController: UIViewController {
   
   let list = ["iPhone", "iPad", "Apple Watch", "iMac Pro", "iMac 5K", "Macbook Pro", "Apple TV"]
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
    // listTableview.visible
      
   }
    
    // 화면 전환 직전 호출
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let cell = sender as? UITableViewCell {
//            if let indexPath = listTableView.indexPath(for: cell) {
//                if let vc = segue.destination as? DetailViewController {
//                    vc.value = list[indexPath.roww]
//                }
//            }
//        }
//    }
}


extension TableViewCellViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return list.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      cell.textLabel?.text = list[indexPath.row]
    cell.imageView?.image = UIImage(named: "star")
      return cell
   }
}


extension TableViewCellViewController: UITableViewDelegate {
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    // 해당 위치 클릭
    if let cell = tableView.cellForRow(at: indexPath) {
        print(cell.textLabel?.text)
   }
}
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        //cell.backgroundView
        //cell.selectedBackgroundView
        //cell.multipleSelectionBackgroundView
    }
}
