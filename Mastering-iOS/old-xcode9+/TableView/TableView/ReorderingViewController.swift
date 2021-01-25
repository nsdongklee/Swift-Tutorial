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

class ReorderingViewController: UIViewController {
   
   var firstList = [String]()
   var secondList = [String]()
   var thirdList = ["iMac Pro", "iMac 5K", "Macbook Pro", "iPad Pro", "iPad", "iPad mini", "iPhone 8", "iPhone 8 Plus", "iPhone SE", "iPhone X", "Mac mini", "Apple TV", "Apple Watch"]
   
   @IBOutlet weak var listTableView: UITableView!
   
   @objc func reloadTableView() {
      listTableView.reloadData()
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      listTableView.setEditing(true, animated: false)
      
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reload", style: .plain, target: self, action: #selector(reloadTableView))
   }   
}


extension ReorderingViewController: UITableViewDataSource {
   func numberOfSections(in tableView: UITableView) -> Int {
      return 3
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      switch section {
      case 0:
         return firstList.count
      case 1:
         return secondList.count
      case 2:
         return thirdList.count
      default:
         return 0
      }
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      switch indexPath.section {
      case 0:
         cell.textLabel?.text = firstList[indexPath.row]
      case 1:
         cell.textLabel?.text = secondList[indexPath.row]
      case 2:
         cell.textLabel?.text = thirdList[indexPath.row]
      default:
         break
      }
      
      return cell
   }
   
   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      switch section {
      case 0:
         return "First Section"
      case 1:
         return "Second Section"
      case 2:
         return "Third Section"
      default:
         return nil
      }
   }
    
    // 셀 옮길 수 있도록 전환
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 충돌하는 여백 제거
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    // 이동 후 드롭할 위치. 실제 데이터의 위치를 바꾸어줌
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // 셀 배열을 새롭게 바꾸어 주어야한다.
        
        // 이동 대상 저장
        var target: String? = nil
        
        switch sourceIndexPath.section {
        case 0:
            target = firstList.remove(at: sourceIndexPath.row)
        case 1:
            target = secondList.remove(at: sourceIndexPath.row)
        case 2:
            target = thirdList.remove(at: sourceIndexPath.row)
        default:
            break
        }
        
        guard let item = target else { return }
        
        switch destinationIndexPath.section {
        case 0:
            firstList.insert(item, at: destinationIndexPath.row)
        case 1:
            secondList.insert(item, at: destinationIndexPath.row)
        case 2:
            thirdList.insert(item, at: destinationIndexPath.row)
        default:
            break
        }
    }
}


extension ReorderingViewController: UITableViewDelegate {
   
    //
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    // 셀을 드래그한다음 원하는 위치를 전달할 때
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        // ...
        return proposedDestinationIndexPath
    }
}














