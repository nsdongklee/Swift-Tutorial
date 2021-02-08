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

class TimerViewController: UIViewController {
   
   @IBOutlet weak var timeLabel: UILabel!
   
   lazy var formatter: DateFormatter = {
      let f = DateFormatter()
      f.dateFormat = "hh:mm:ss"
      return f
   }()
   
   @IBAction func unwindToTimerHome(_ sender: UIStoryboardSegue) {
      
   }
   
   func updateTimer(_ timer: Timer) {
      print(#function, Date(), timer)
      timeLabel.text = formatter.string(from: Date())
   }
   
   func resetTimer() {
      timeLabel.text = "00:00:00"
   }
   
   var timer: Timer?
   
    // 생성자로 전달할 메소드
    @objc func timeFired(_ timer: Timer) {
        updateTimer(timer)
    }
    
    
   @IBAction func startTimer(_ sender: Any) {
    guard timer == nil else {
        return
    }
//    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
//        guard timer.isValid else { return }
//        self.updateTimer(timer)
//    })
    
    
    timer = Timer(timeInterval: 1, target: self, selector: #selector(timeFired(_:)), userInfo: nil, repeats: true)
    
    // 허용오차 별도지정
    timer?.tolerance = 0.2
    
    // 런루프에 접근해서 fired 시켜야함
    RunLoop.current.add(timer!, forMode: .defaultRunLoopMode)
    timer?.fire()
   }
   
   @IBAction func stopTimer(_ sender: Any) {
    // true 로 인해서 반복사용한다면 해당 메소드를 사용해서 적절한 시기에 중지시킬 수 있어야함
    timer?.invalidate()
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      resetTimer()
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
    startTimer(self)
   }
   
   override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
    timer?.invalidate()
    timer = nil
   }
}
