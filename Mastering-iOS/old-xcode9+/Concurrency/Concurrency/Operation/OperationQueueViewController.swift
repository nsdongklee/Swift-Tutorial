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

class OperationQueueViewController: UIViewController {
   
   //큐 인스턴스 생성
    let queue = OperationQueue()
    var isCancelled = false
    
   @IBAction func startOperation(_ sender: Any) {
    // 취소 속성 값 초기화
    isCancelled = false
    
    queue.addOperation {
        // 오퍼레이션은 메모리 관리 직접 처리 못함
        autoreleasepool {
            for _ in 1 ..< 100 {
                guard !self.isCancelled else {
                    return
                }
                print("👻", separator: " ", terminator: " ")
                // 반복 지연 추가
                Thread.sleep(forTimeInterval: 0.3)
            }
        }
    }
    let op = BlockOperation {
        autoreleasepool {
            for _ in 1..<100 {
                guard !self.isCancelled else {
                    return
                }
                print("🤡", separator: " ", terminator: " ")
                Thread.sleep(forTimeInterval: 0.6)
            }
        }
    }
    queue.addOperation(op)
    
    op.addExecutionBlock {
        autoreleasepool {
            for _ in 1..<100 {
                guard !self.isCancelled else {
                    return
                }
                print("👾", separator: " ", terminator: " ")
                Thread.sleep(forTimeInterval: 0.5)
            }
        }
    }
    
    // 커스텀 클래스로 추가
    let op2 = CustomOperation(type: "😻")
    queue.addOperation(op2)
    
    op.completionBlock = {
        print("Done")
    }
    
    
   }
   @IBAction func cancelOperation(_ sender: Any) {
    //취소 속성 변경
    isCancelled = true
    
    // 해당 메소드를 사용해도 바로 취소되지 않는다.
    queue.cancelAllOperations()
   }
   
   deinit {
      print(self, #function)
   }
}
