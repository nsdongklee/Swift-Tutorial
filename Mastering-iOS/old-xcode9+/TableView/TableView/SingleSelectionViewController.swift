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

class SingleSelectionViewController: UIViewController {
   
   let list = Region.generateData()
   
   @IBOutlet weak var listTableView: UITableView!
   
    // 랜덤으로 셀 선택
   func selectRandomCell() {
    let section = Int(arc4random_uniform(UInt32(list.count)))
    let row = Int(arc4random_uniform(UInt32(list[section].countries.count)))
    let targetIndexPath = IndexPath(row: row, section: section)
    
    listTableView.selectRow(at: targetIndexPath, animated: true, scrollPosition: .top)
   }
   
   func deselect() {
    if let selected = listTableView.indexPathForSelectedRow {
        listTableView.deselectRow(at: selected, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            [weak self] in
            let first = IndexPath(row: 0, section: 0)
            self?.listTableView.scrollToRow(at: first, at: .top, animated: true)
        }
    }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showMenu(_:)))
   }
   
   @objc func showMenu(_ sender: UIBarButtonItem) {
      let menu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
      
      let selectRandomCellAction = UIAlertAction(title: "Select Random Cell", style: .default) { (action) in
         self.selectRandomCell()
      }
      menu.addAction(selectRandomCellAction)
      
      let deselectAction = UIAlertAction(title: "Deselect", style: .default) { (action) in
         self.deselect()
      }
      menu.addAction(deselectAction)
      
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      menu.addAction(cancelAction)
      
      if let pc = menu.popoverPresentationController {
         pc.barButtonItem = sender
      }
      
      present(menu, animated: true, completion: nil)
   }
}

extension SingleSelectionViewController: UITableViewDataSource {
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
   
   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      return list[section].title
   }
}


extension SingleSelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0 {
            return nil
        }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 경고창 표시
        let target = list[indexPath.section].countries[indexPath.row]
        showAlert(with: target)
    }
    
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("deSelected \(indexPath)")
    }
    
    // 셀 강조 boolean
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return indexPath.row != 0
    }
    
    // 셀 상태에 따라서 상태를 변경할 수 있음
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
//        tableView.cellForRow(at: indexPath)?.textLabel?.textColor = UIColor.black
    }
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
//        tableView.cellForRow(at: indexPath)?.textLabel?.textColor = UIColor(white: 217.0/255.0, alpha: 1.0)
    }
}


extension UIViewController {
   func showAlert(with value: String) {
      let alert = UIAlertController(title: nil, message: value, preferredStyle: .alert)
      
      let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
      alert.addAction(okAction)
      
      present(alert, animated: true, completion: nil)
   }
}

class SingleSelectionCell: UITableViewCell {
   override func awakeFromNib() {
      super.awakeFromNib()
      
    // 레이블의 텍스트 컬러 지정
    textLabel?.textColor = UIColor(white: 217.0/255.0, alpha: 1.0)
    textLabel?.highlightedTextColor = UIColor.black
   }
}






