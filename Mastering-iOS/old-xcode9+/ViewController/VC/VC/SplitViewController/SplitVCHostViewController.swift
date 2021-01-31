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

class SplitVCHostViewController: UIViewController {
    @available(iOS 11.0, *)
    @IBAction func presentSplitViewController(_ sender: Any) {
    guard let masterVC = storyboard?.instantiateViewController(withIdentifier: "ColorListTableViewController") else {
        return
    }
    let nav = UINavigationController(rootViewController: masterVC)
    
    guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "ColorDetailViewController") else {
        return
    }
    
    let splitVC = CustomSplitViewController()
    splitVC.viewControllers = [nav, detailVC]
    
    // 스와이프 제스처 사용여부
    splitVC.presentsWithGesture = false
    // 마스터뷰 컨트롤러 너비(읽기 전용>> 원하는 너비로 못 맞춤)
    splitVC.primaryColumnWidth
    splitVC.preferredPrimaryColumnWidthFraction = 0.5
    
    splitVC.minimumPrimaryColumnWidth = 100
    splitVC.maximumPrimaryColumnWidth = view.bounds.width / 2
    
        if #available(iOS 11.0, *) {
            splitVC.primaryEdge = .trailing
        } else {
            // Fallback on earlier versions
        }
    
    present(splitVC, animated: true, completion: nil)
   }
   
   @IBAction func unwindToSplitHost(_ sender: UIStoryboardSegue) {
      
   }
   
   // segue 가 호출되기 전에 할 동작들
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CustomSplitViewController {
            vc.setupDefaultValue()
        }
    }
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Do any additional setup after loading the view.
   }
}





























