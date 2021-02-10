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

class ManagedObjectViewController: UIViewController {
   // 데이터를 저장할 배열 선언
    var list = [PersonEntity]()
    
   var token: NSObjectProtocol!
   @IBOutlet weak var listTableView: UITableView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
    // 데이터를 읽어오고, 리스트 배열에 저장하고 테이블뷰 reload
    list = DataManager.shared.fetchPerson()
    listTableView.reloadData()
    
      token = NotificationCenter.default.addObserver(forName: PersonComposeViewController.newPersonDidInsert, object: nil, queue: .main, using: { [weak self] (noti) in
        self?.list = DataManager.shared.fetchPerson()
        self?.listTableView.reloadData()
      })
      
   }
   
   deinit {
      NotificationCenter.default.removeObserver(token)
   }
}


extension ManagedObjectViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//      return 0
    return list.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
    //
    let person = list[indexPath.row]
    cell.textLabel?.text = person.name
    cell.detailTextLabel?.text = "\(person.age)"
      
      return cell
   }
   
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      switch editingStyle {
      case .delete:
//         break
        let person = list.remove(at: indexPath.row)
        DataManager.shared.delete(entity: person)
        tableView.deleteRows(at: [indexPath], with: .automatic)
      default:
         break
      }
   }
}


extension ManagedObjectViewController: UITableViewDelegate {
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
      
    // 데이터 수정 코드
    let person = list[indexPath.row]
    
    if let nav = storyboard?.instantiateViewController(withIdentifier: "ComposeNav") as? UINavigationController, let composeVC = nav.viewControllers.first as? PersonComposeViewController {
        composeVC.target = person
        present(nav, animated: true, completion: nil)
    }
   }
}
