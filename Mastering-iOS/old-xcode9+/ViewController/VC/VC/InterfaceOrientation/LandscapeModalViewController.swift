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
import AVFoundation

class LandscapeModalViewController: UIViewController {

   @IBOutlet weak var closeButton: UIButton!
   @IBOutlet weak var playerView: PlayerView!
   
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeLeft
    }
    
    // 사이즈 클래스를 통해서 뷰의 사이즈를 대략적으로 파악
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        
        print(newCollection.verticalSizeClass.description)
        
        switch newCollection.verticalSizeClass {
        case .regular:
            closeButton.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        default:
            closeButton.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        }
    }
    
    // 가로인지 세로인지 확인하려면 루트뷰의 사이즈를 명확하게 알아야한다.
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        
        
        coordinator.animate(alongsideTransition: { (context) in
            if size.height > size.width {
                self.closeButton.backgroundColor = UIColor.red.withAlphaComponent(0.5)
            } else {
                self.closeButton.backgroundColor = UIColor.green.withAlphaComponent(0.5)
            }
        }, completion: nil)
    }
    
   override func viewDidLoad() {
      super.viewDidLoad()
      
      guard let url = Bundle.main.url(forResource: "video", withExtension: "mp4") else { return }
      let player = AVPlayer(url: url)
      playerView.player = player
   }
   
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      
      playerView.player?.play()
   }
   
   override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      
      playerView.player?.pause()
   }
   
   
}



extension UIUserInterfaceSizeClass {
   var description: String {
      switch self {
      case .compact:
         return "Compact"
      case .regular:
         return "Regular"
      default:
         return "Unspecified"
      }
   }
}
















