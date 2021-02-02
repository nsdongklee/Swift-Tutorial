//
//  HalfEmbedingUnwindSegue.swift
//  Segue
//
//  Created by 이동규 on 2021/02/02.
//  Copyright © 2021 Keun young Kim. All rights reserved.
//

import UIKit

class HalfEmbedingUnwindSegue: UIStoryboardSegue {
    
    override func perform() {
        // 최종 animation 프레임
        var frame = source.view.frame
        frame = frame.offsetBy(dx: 0, dy: frame.height)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.destination.view.frame = frame
            self.destination.view.alpha = 1.0
        }, completion: { (finished) in
            self.source.view.removeFromSuperview()
            self.source.removeFromParentViewController()
        })
    }
}
