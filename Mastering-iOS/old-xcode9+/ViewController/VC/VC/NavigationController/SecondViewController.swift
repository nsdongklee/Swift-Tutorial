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

class SecondViewController: UIViewController {
   
    
    // 코드로 직접구현하는 백버튼
   @IBAction func pop(_ sender: Any) {
    navigationController?.popViewController(animated: true)
   }
   
   @IBAction func pushThird(_ sender: Any) {
    guard  let thirdVC = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") else {
        return
    }
    navigationController?.pushViewController(thirdVC, animated: true)
   }
   
   @objc func addRightButtons() {
      let btn1 = UIBarButtonItem(barButtonSystemItem: .action, target: nil, action: nil)
      let btn2 = UIBarButtonItem(title: "Two", style: .plain, target: nil, action: nil)
    
    let sw = UISwitch()
    let switchItem = UIBarButtonItem(customView: sw)
    // 네비게이션 아이템은 배열로 저장
    navigationItem.setRightBarButtonItems( [switchItem, btn1, btn2], animated: true)
      
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
    navigationItem.leftItemsSupplementBackButton = true
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem:  .add, target: self, action: #selector(addRightButtons))
   }
}


























