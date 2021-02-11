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
import CoreData

class FetchAllViewController: UITableViewController {
   
   var list = [NSManagedObject]()
   
   @IBAction func fetch(_ sender: Any?) {
      let context = DataManager.shared.mainContext
      
//    // 첫 번째 방법
//    let request = NSFetchRequest<NSManagedObject>() // 상속할 클래스를 지정해놔야함
//    let entity = NSEntityDescription.entity(forEntityName: "Employee", in: context)
//    request.entity = entity
    
//    // 두 번째 방법: 엔티티 인스턴스 미생성, 생성자로 엔티티 이름 전달
//    let request = NSFetchRequest<NSManagedObject>(entityName: "Employee")
    
    // 엔티티 메소드가 제공하는 메소드 활용
    let request: NSFetchRequest<EmployeeEntity> = EmployeeEntity.fetchRequest()
    
//    // 요청 직접실행하는 메소드
//    request.execute()
    
    // 요청을 컨텍스트로 전달
    do {
        list = try context.fetch(request)
        tableView.reloadData()
    } catch {
     fatalError()
    }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      fetch(nil)
   }
}


extension FetchAllViewController {
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return list.count
   }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      cell.textLabel?.text = list[indexPath.row].value(forKey: "name") as? String
      
      return cell
   }
}
