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

class URLRequestViewController: UIViewController {
   
   @IBOutlet weak var imageView: UIImageView!
   
   @IBAction func sendRequest(_ sender: Any) {
      imageView.image = nil
      
      // Code Input Point #1
    guard let url = URL(string: picUrlStr) else {
        fatalError("Invalid URL")
    }
    
    // 메인쓰레드에서 실행되기때문에 작업이 완료되는 동안 다른 작업 못함
//    do {
//        let data = try Data(contentsOf: url)
//        imageView.image = UIImage(data: data)
//    } catch {
//        print(error)
//    }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            print(error)
        } else if let data = data {
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    task.resume()
      // Code Input Point #1
   }
}
