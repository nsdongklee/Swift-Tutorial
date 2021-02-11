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

class ResultTypesViewController: UIViewController {
   
   let context = DataManager.shared.mainContext
   
    // 디폴트 리턴 타입
   @IBAction func fetchManagedObject(_ sender: Any) {
      let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
      
    // 리턴 타입 지정
    request.resultType = .managedObjectResultType
    
      do {
         let list = try context.fetch(request)
         if let first = list.first {
            print(type(of: first))
            print(first)                        
         }
      } catch {
         fatalError(error.localizedDescription)
      }
   }
   
   @IBAction func fetchCount(_ sender: Any) {
      let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
      
    // 리퀘스트로 가져온 데이터 수를 출력
    request.resultType = .countResultType
    
      do {
         let list = try context.fetch(request)
         if let first = list.first {
            print(type(of: first))
            print(first)
         }
        
        let cnt = try context.count(for: request)
        
      } catch {
         fatalError(error.localizedDescription)
      }
   }
   
   @IBAction func fetchDictionary(_ sender: Any) {
      let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
    
    // 특정 attr 집합만 가져올 때
    request.resultType = .dictionaryResultType

    // 그래서 이름과 주소만 가져오도록 속성 접근
    request.propertiesToFetch = ["name", "address"]
    
      do {
         let list = try context.fetch(request)
         if let first = list.first {
            print(type(of: first))
            print(first)
         }
      } catch {
         fatalError(error.localizedDescription)
      }
   }
   
   @IBAction func fetchManagedObjectID(_ sender: Any) {
      let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
      // 데이터를 주고받을 때 쓰는 고유한 아이디
    request.resultType = .managedObjectResultType
    
    
    
      do {
         let list = try context.fetch(request)
         if let first = list.first {
            print(type(of: first))
            print(first)
         }
      } catch {
         fatalError(error.localizedDescription)
      }
   }
}
