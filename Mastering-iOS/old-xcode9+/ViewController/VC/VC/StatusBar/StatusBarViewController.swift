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

class StatusBarViewController: UIViewController {
   
    var hidden = false
    
    override var prefersStatusBarHidden: Bool {
        return hidden
    }
   
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .none
    }
    
   @IBAction func toggleVisibility(_ sender: Any) {
//    // 읽기전용 속성이라 값 저장할 수 있는 속성 따로 만들어야함
//      prefersStatusBarHidden = !prefersStatusBarHidden
    hidden = !hidden
    
    // 애니메이션 블록에서 호출되도록 지정
    UIView.animate(withDuration: 0.3) {
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
   }
    
    var style = UIStatusBarStyle.default
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return style
    }
    
   @IBAction func toggleStyle(_ sender: Any) {
    let color  = style == .default ? UIColor.white : UIColor.darkGray
    UIView.animate(withDuration: 0.3) {
        self.view.backgroundColor = color
    }
    setNeedsStatusBarAppearanceUpdate()
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Do any additional setup after loading the view.
      
   }
}



extension StatusBarViewController {
   @IBAction func unwindToHere(_ sender: UIStoryboardSegue) {
      
   }
}













