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


class DispatchQueueViewController: UIViewController {
   
   @IBOutlet weak var valueLabel: UILabel!
    
   let serialWorkQueue = DispatchQueue(label: "SerialWorkQueue")
    let concurrentWorkQueue = DispatchQueue(label: "", attributes: .concurrent)
    
   
   @IBAction func basicPattern(_ sender: Any) {
    // 쓰레드 나누는 기본패턴
    DispatchQueue.global().async {
        var total = 0
        for num in 1...100 {
           total += num
           Thread.sleep(forTimeInterval: 0.1)
        }
        DispatchQueue.main.async {
            self.valueLabel.text = "\(total)"
        }
    }
   }
   
   @IBAction func sync(_ sender: Any) {
    concurrentWorkQueue.sync {
        for _ in 0..<3 {
            print("Hello")
        }
        print("Point 1")
    }
    print("Point 2")
   }
   
   @IBAction func async(_ sender: Any) {
    concurrentWorkQueue.async {
        for _ in 0..<3 {
            print("Hello")
        }
        print("Point 1")
    }
    print("Point 2")
   }
   
   @IBAction func delay(_ sender: Any) {
    let delay = DispatchTime.now() + 3
    
    concurrentWorkQueue.asyncAfter(deadline: delay) {
        print("Point 1")
    }
    print("Point 2")
   }
   
   @IBAction func concurrentIteration(_ sender: Any) {
    var start = DispatchTime.now()
    
    for idx in 0..<20 {
        print(idx, separator: " ", terminator: " ")
        Thread.sleep(forTimeInterval: 0.2)
    }
    var end = DispatchTime.now()
    print("\nfor-in: ", Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 10000000)
    
    // 병렬실행으로 속도 높이기
    DispatchQueue.concurrentPerform(iterations: 20) { (index) in
        print(index, separator: " ", terminator: " ")
        Thread.sleep(forTimeInterval: 0.2)
    }
    end = .now()
    print("\nconcurrentPerform: ", Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 10000000)

   }
}
























