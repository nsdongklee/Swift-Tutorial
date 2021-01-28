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

class ViewManagementViewController: UIViewController {
   
    @IBOutlet weak var redView: UIView!
    
    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var blueView: UIView!
    
    var grayView: UIView?
   
   func addRandomView() {
      let v = generateRandomView()
    
    // 루트뷰에 접근할때는 view 를 사용한다.
    view.addSubview(v)
   }
   
   func insertRandomViewToBack() {
      // 특정위치에 view 추가
    let v = generateRandomView()
    view.insertSubview(v, at: 0)
   }
   
   func removeTopmostRandomView() {
      // 가장 앞에 표시된 랜덤뷰를 삭제, 맨 앞이 0
    let topmostRandomView = view.subviews.reversed().first { $0.tag > 0 }
    topmostRandomView?.removeFromSuperview()
   }
   
   func bringRedViewToFront() {
    // 서브뷰를 가장 앞쪽으로
    view.bringSubview(toFront: redView)
   }
   
   func sendRedViewToBack() {
    view.sendSubview(toBack: redView)
   }
   
   func switchGreenViewWithBlueView() {
    // 파라미터로 서브뷰의 인덱스를 전달해야함
    guard let greenViewIndex = view.subviews.index(of: greenView) else {
        return
    }
    guard let blueViewIndex = view.subviews.index(of: blueView) else {
        return
    }
    
    // 파랑과 초록 뷰 위치교체
    view.exchangeSubview(at: greenViewIndex, withSubviewAt: blueViewIndex)
   }
   
   func addGrayViewToRedView() {
      // 새로운 그레이뷰 추가
    grayView = generateGrayView()
    redView.addSubview(grayView!)
   }
   
   func moveGrayViewToRootView() {
    if let grayView = grayView {
        view.addSubview(grayView)
    }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showMenu))
   }
}



extension ViewManagementViewController {
   @objc func showMenu() {
      let menu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
      
      let addRandomViewAction = UIAlertAction(title: "Add Random View", style: .default) { [weak self] (action) in
         self?.addRandomView()
      }
      menu.addAction(addRandomViewAction)
      
      let insertRandomViewToBackAction = UIAlertAction(title: "Insert Random View to Back", style: .default) { [weak self] (action) in
         self?.insertRandomViewToBack()
      }
      menu.addAction(insertRandomViewToBackAction)
      
      let removeTopmostRandomViewAction = UIAlertAction(title: "Remove Topmost Random View", style: .default) { [weak self] (action) in
         self?.removeTopmostRandomView()
      }
      menu.addAction(removeTopmostRandomViewAction)
      
      let bringRedViewToFrontAction = UIAlertAction(title: "Bring Red View to Front", style: .default) { [weak self] (action) in
         self?.bringRedViewToFront()
      }
      menu.addAction(bringRedViewToFrontAction)
      
      let sendRedViewToBackAction = UIAlertAction(title: "Send Red View to Back", style: .default) { [weak self] (action) in
         self?.sendRedViewToBack()
      }
      menu.addAction(sendRedViewToBackAction)
      
      let switchGreenViewWithBlueViewAction = UIAlertAction(title: "Switch Green View with Blue View", style: .default) { [weak self] (action) in
         self?.switchGreenViewWithBlueView()
      }
      menu.addAction(switchGreenViewWithBlueViewAction)
      
      let addGrayViewToRedViewAction = UIAlertAction(title: "Add Gray View to Red View", style: .default) { [weak self] (action) in
         self?.addGrayViewToRedView()
      }
      menu.addAction(addGrayViewToRedViewAction)
      
      let moveGrayViewToRootViewAction = UIAlertAction(title: "Move Gray View to Root View", style: .default) { [weak self] (action) in
         self?.moveGrayViewToRootView()
      }
      menu.addAction(moveGrayViewToRootViewAction)
      
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      menu.addAction(cancelAction)
      
      present(menu, animated: true, completion: nil)
   }
   
   func generateRandomView() -> UIView {
      let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
      let v = UIView(frame: frame)
      v.center = view.center
      v.backgroundColor = UIColor.random
      v.tag = Int(arc4random_uniform(UInt32(Int16.max)) + 1)
      
      return v
   }
   
   func generateGrayView() -> UIView {
      let frame = CGRect(x: 100, y: 100, width: 50, height: 50)
      let v = UIView(frame: frame)
      v.backgroundColor = UIColor.gray
      
      return v
   }
}



extension UIColor {
   static var random: UIColor {
      let r = CGFloat(arc4random_uniform(256)) / 255
      let g = CGFloat(arc4random_uniform(256)) / 255
      let b = CGFloat(arc4random_uniform(256)) / 255
      
      return UIColor(displayP3Red: r, green: g, blue: b, alpha: 1.0)
   }
}


















