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

class EditModeViewController: UIViewController {
   
   var editingSwitch: UISwitch!
   @IBOutlet weak var listTableView: UITableView!
   
   var productList = ["iMac Pro", "iMac 5K", "Macbook Pro", "iPad Pro", "iPhone X", "Mac mini", "Apple TV", "Apple Watch"]
   var selectedList = [String]()
   
   @objc func toggleEditMode(_ sender: UISwitch) {
    listTableView.setEditing(sender.isOn, animated: true)
   }
   
   @objc func emptySelectedList() {
      
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      editingSwitch = UISwitch(frame: .zero)
      editingSwitch.addTarget(self, action: #selector(toggleEditMode(_:)), for: .valueChanged)
      // 스위치 초기값
    editingSwitch.isOn = listTableView.isEditing
      let deleteButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(emptySelectedList))
      deleteButton.tintColor = UIColor.red
      
      navigationItem.rightBarButtonItems = [deleteButton, UIBarButtonItem(customView: editingSwitch)]
   }
}


extension EditModeViewController: UITableViewDataSource {
   func numberOfSections(in tableView: UITableView) -> Int {
      return 2
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      switch section {
      case 0:
         return selectedList.count
      case 1:
         return productList.count
      default:
         return 0
      }
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      switch indexPath.section {
      case 0:
         cell.textLabel?.text = selectedList[indexPath.row]
      case 1:
         cell.textLabel?.text = productList[indexPath.row]
      default:
         break
      }
      
      return cell
   }
   
   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      switch section {
      case 0:
         return "Selected List"
      case 1:
         return "Product List"
      default:
         return nil
      }
   }
    // 편집모드로 사용할 수 있게 해주는 메소드
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert:
            let target = productList[indexPath.row]
            let insertIndexPath = IndexPath(row: selectedList.count, section: 0)
            selectedList.append(target)
            productList.remove(at: indexPath.row)
            
            listTableView.beginUpdates()
            listTableView.insertRows(at: [insertIndexPath], with: .automatic)
            listTableView.deleteRows(at: [indexPath], with: .automatic)
            listTableView.endUpdates()
            
        case .delete:
            let target = selectedList[indexPath.row]
            let insertIndexPath = IndexPath(row: productList.count, section: 1)
            productList.append(target)
            selectedList.remove(at: indexPath.row)
            
            listTableView.endUpdates()
            listTableView.insertRows(at: [insertIndexPath], with: .automatic)
            listTableView.deleteRows(at: [indexPath], with: .automatic)
            listTableView.beginUpdates()
        default:
            break
        }
    }
}


extension EditModeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        
        switch indexPath.row {
        case 0:
            return .delete
        case 1:
            return .insert
        default:
            return .none
        }
    }
}


















