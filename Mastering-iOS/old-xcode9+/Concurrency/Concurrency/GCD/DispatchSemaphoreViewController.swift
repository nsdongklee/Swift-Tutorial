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

class DispatchSemaphoreViewController: UIViewController {
   
   var value = 0
   
   @IBOutlet weak var valueLabel: UILabel!
   
   let workQueue = DispatchQueue(label: "WorkQueue", attributes: .concurrent)
   let group = DispatchGroup()
   
   @IBAction func synchronize(_ sender: Any) {
      value = 0
      valueLabel.text = "\(value)"
      
    //semaphore 생성
    let sem = DispatchSemaphore(value: 1)   //
    
      workQueue.async(group: group) {
         for _ in 1...1000 {
            sem.wait()  // 카운트가 증가할때 까지 기다림
            self.value += 1
            sem.signal()    // 대기중인 다른 작업이 실행되도록 semaphore 에 알려줌
         }
      }
      
      workQueue.async(group: group) {
         for _ in 1...1000 {
            sem.wait()
            self.value += 1
            sem.signal()
         }
      }
      
      workQueue.async(group: group) {
         for _ in 1...1000 {
            sem.wait()
            self.value += 1
            sem.signal()
         }
      }
      
      group.notify(queue: DispatchQueue.main) {
         self.valueLabel.text = "\(self.value)"
      }
   }
   
   @IBAction func controlExecutionOrder(_ sender: Any) {
      value = 0
      valueLabel.text = "\(value)"
      
    let sem = DispatchSemaphore(value: 0)
    
      workQueue.async {
         for _ in 1...100 {
            self.value += 1
            Thread.sleep(forTimeInterval: 0.1)
         }
        
        sem.signal()
      }
      
      DispatchQueue.main.async {
//        sem.wait()
         self.valueLabel.text = "\(self.value)"
      }
   }
}
















