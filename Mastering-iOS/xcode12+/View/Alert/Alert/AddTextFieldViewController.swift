//
//  Mastering iOS
//  Copyright (c) KxCoding <help@kxcoding.com>
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

class AddTextFieldViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBAction func show(_ sender: Any) {
        let controller = UIAlertController(title: "Sign in to iTunes Store", message: nil, preferredStyle: .alert)
        controller.addTextField { (idField) in
            idField.placeholder = "Apple ID"
        }
        controller.addTextField { (passwordField) in
            passwordField.placeholder = "Input Passwords"
            passwordField.isSecureTextEntry = true
        }
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] (action) in
            if let fieldList = controller.textFields {
                if let idField = fieldList.first {
                    self?.idLabel.text = idField.text
                }
                if let passwordField = fieldList.last {
                    self?.passwordLabel.text = passwordField.text
                }
            }
        }
        controller.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        controller.addAction(cancelAction)
        present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}


























