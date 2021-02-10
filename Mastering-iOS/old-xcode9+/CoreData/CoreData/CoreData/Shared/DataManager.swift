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

class DataManager {
   static let shared = DataManager()
   
   private init() { }
   
    var container: NSPersistentContainer?

   var mainContext: NSManagedObjectContext {
//      fatalError("Not Implemented")
    
    // 컨테이너가 생성한 기본 컨텍스트 리턴
    guard let context = container?.viewContext else {
        fatalError()
    }
    return context
   }
    
    func setup(modelName: String) {
        container = NSPersistentContainer(name: modelName)
        container?.loadPersistentStores(completionHandler: { (desc, error) in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        })
    }
   
   func saveMainContext() {
//      fatalError("Not Implemented")
    mainContext.perform {
        if self.mainContext.hasChanges {
            do {
                try self.mainContext.save()
            } catch {
                print(error)
            }
        }
    }
   }
}
