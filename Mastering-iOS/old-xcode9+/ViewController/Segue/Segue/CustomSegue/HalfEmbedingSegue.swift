//
//  HalfEmbedingSegue.swift
//  Segue
//
//  Created by 이동규 on 2021/02/02.
//  Copyright © 2021 Keun young Kim. All rights reserved.
//

import UIKit

class HalfEmbedingSegue: UIStoryboardSegue {
    
    override init(identifier: String?, source: UIViewController, destination: UIViewController) {
        
        // 상위구현을 먼저 작동시켜야함
        super.init(identifier: identifier, source: source, destination: destination)
    }
    
    override func perform() {
        var frame = source.view.bounds
        frame.origin.y = frame.height
        frame.size.height = frame.height / 2
        
        source.view.addSubview(destination.view)
        destination.view.frame = frame
        destination.view.alpha = 0.0
        
        source.addChildViewController(destination)
        
        frame.origin.y = source.view.bounds.height / 2
        
        UIView.animate(withDuration: 0.3) {
            self.destination.view.frame = frame
            self.destination.view.alpha = 1.0
        }
    }
}
