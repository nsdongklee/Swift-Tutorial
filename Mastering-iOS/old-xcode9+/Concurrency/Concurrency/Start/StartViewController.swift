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

class StartViewController: UIViewController {
   
   @IBOutlet weak var countLabel: UILabel!
   
   
   @IBAction func start(_ sender: Any) {
      countLabel.text = "0"
    
    // 주요시점 로그 출력
    logThread(with: "Start")
      
    // 아래 코드를 백그라운드에서 실행되도록
    DispatchQueue.global().async {
        for count in 1 ... 100 {
            DispatchQueue.main.async {
                self.logThread(with: "Update Label")
                self.countLabel.text = "\(count)"
            }
            Thread.sleep(forTimeInterval: 0.1)
        }
        self.logThread(with: "Done")
    }
//      for count in 0...100 {
//         countLabel.text = "\(count)"
//      }
    self.logThread(with: "End")
   }

   func logThread(with task: String) {
      if Thread.isMainThread {
         print("Main Thread: \(task)")
      } else {
         print("Background Thread: \(task)")
      }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
   }
}
