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

class AlignEdgeViewController: UIViewController {
   
   @IBOutlet weak var topContainer: UIView!
   
   @IBOutlet weak var bottomContainer: UIView!
   
   @IBOutlet weak var nameTitleLabel: UILabel!
   
   @IBOutlet weak var nameInputField: UITextField!
   
   @IBOutlet weak var emailTitleLabel: UILabel!
   
   @IBOutlet weak var emailInputField: UITextField!
   
   @IBOutlet weak var confirmButton: UIButton!
   
   var anchorView: UIView {
      return nameTitleLabel
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
    // 마진 설정
    if #available(iOS 11.0, *) {
        var current = topContainer.directionalLayoutMargins
        current.leading = 30
        topContainer.directionalLayoutMargins = current
        bottomContainer.directionalLayoutMargins = current
    } else {
        // Fallback on earlier versions
        var current = topContainer.layoutMargins
        current.left = 30
        topContainer.layoutMargins = current
        bottomContainer.layoutMargins = current
    }
    
    
      layoutWithInitializer()
      //layoutWithVisualFormatLanguage()
      //layoutWithAnchor()
   }
}















extension AlignEdgeViewController {
   func layoutWithInitializer() {
    nameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    nameInputField.translatesAutoresizingMaskIntoConstraints = false
    emailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    emailInputField.translatesAutoresizingMaskIntoConstraints = false
    confirmButton.translatesAutoresizingMaskIntoConstraints = false
    
    var leading = NSLayoutConstraint(item: nameTitleLabel, attribute: .leading, relatedBy: .equal, toItem: bottomContainer, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0)
    var top = NSLayoutConstraint(item: nameTitleLabel, attribute: .top, relatedBy: .equal, toItem: bottomContainer, attribute: .topMargin, multiplier: 1.0, constant: 0.0)
    var trailing = NSLayoutConstraint(item: nameTitleLabel, attribute: .trailing, relatedBy: .equal, toItem: bottomContainer, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0)
    NSLayoutConstraint.activate([leading, top, trailing])
    
    // 여백추가
    top = NSLayoutConstraint(item: nameInputField, attribute: .top, relatedBy: .equal, toItem: nameTitleLabel, attribute: .bottom, multiplier: 1.0, constant: 10.0)
    leading = NSLayoutConstraint(item: nameInputField, attribute: .leading, relatedBy: .equal, toItem: anchorView, attribute: .leading, multiplier: 1.0, constant: 0.0)
    trailing = NSLayoutConstraint(item: nameInputField, attribute: .trailing, relatedBy: .equal, toItem: anchorView, attribute: .trailing, multiplier: 1.0, constant: 0.0)
    NSLayoutConstraint.activate([leading, top, trailing])
    
    top = NSLayoutConstraint(item: emailTitleLabel, attribute: .top, relatedBy: .equal, toItem: nameInputField, attribute: .bottom, multiplier: 1.0, constant: 20.0)
    leading = NSLayoutConstraint(item: emailTitleLabel, attribute: .leading, relatedBy: .equal, toItem: anchorView, attribute: .leading, multiplier: 1.0, constant: 0.0)
    trailing = NSLayoutConstraint(item: emailTitleLabel, attribute: .trailing, relatedBy: .equal, toItem: anchorView, attribute: .trailing, multiplier: 1.0, constant: 0.0)
    NSLayoutConstraint.activate([top, trailing, leading])
    
    top = NSLayoutConstraint(item: emailInputField, attribute: .top, relatedBy: .equal, toItem: emailTitleLabel, attribute: .bottom, multiplier: 1.0, constant: 10.0)
    leading = NSLayoutConstraint(item: emailInputField, attribute: .leading, relatedBy: .equal, toItem: anchorView, attribute: .leading, multiplier: 1.0, constant: 0.0)
    trailing = NSLayoutConstraint(item: emailInputField, attribute: .trailing, relatedBy: .equal, toItem: anchorView, attribute: .trailing, multiplier: 1.0, constant: 0.0)
    NSLayoutConstraint.activate([top, leading, trailing])
    
    leading = NSLayoutConstraint(item: confirmButton, attribute: .leading, relatedBy: .equal, toItem: anchorView, attribute: .leading, multiplier: 1.0, constant: 0.0)
    trailing = NSLayoutConstraint(item: confirmButton, attribute: .trailing, relatedBy: .equal, toItem: anchorView, attribute: .trailing, multiplier: 1.0, constant: 0.0)
    
    top = NSLayoutConstraint(item: confirmButton, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: emailInputField, attribute: .bottom, multiplier: 1.0, constant: 10)
    let bottom = NSLayoutConstraint(item: confirmButton, attribute: .bottom, relatedBy: .equal, toItem: bottomContainer, attribute: .bottom, multiplier: 1.0, constant: 0.0)
    let height = NSLayoutConstraint(item: confirmButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40.0)
    NSLayoutConstraint.activate([leading, trailing, top, bottom, height])
   }
}


































extension AlignEdgeViewController {
   func layoutWithVisualFormatLanguage() {
    nameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    nameInputField.translatesAutoresizingMaskIntoConstraints = false
    emailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    emailInputField.translatesAutoresizingMaskIntoConstraints = false
    confirmButton.translatesAutoresizingMaskIntoConstraints = false
    
    let views: [String: Any] = ["nameTitle": nameTitleLabel, "nameInput": nameInputField, "emailTitle": emailTitleLabel, "emailInput": emailInputField, "btn": confirmButton]
    let horizFmt = "|-[nameTitle]-|"
    let horizConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizFmt, options: [], metrics: nil, views: views)
    NSLayoutConstraint.activate(horizConstraints)
    
    let vertFmt = "V:|-[nameTitle]-10-[nameInput]-20-[emailTitle]-10-[emailInput]-(>=10)-[btn(40)]|"
    let vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: vertFmt, options: [.alignAllLeading, .alignAllTrailing], metrics: nil, views: views)
    NSLayoutConstraint.activate(vertConstraints)
   }
}































extension AlignEdgeViewController {
   func layoutWithAnchor() {
      
   }
}




























