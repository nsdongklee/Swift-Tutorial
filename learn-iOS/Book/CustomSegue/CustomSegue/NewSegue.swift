//
//  NewSegue.swift
//  CustomSegue
//
//  Created by 이동규 on 2021/09/20.
//

import Foundation
import UIKit

class NewSegue: UIStoryboardSegue {
    // 커스텀 세그웨이 구현을 위해 UIStoryboardSegue 서브클래싱
    override func perform() {
        // 세그웨이 출발지 뷰컨트롤러 저장
        let srcUVC = self.source
        // 세그웨이 목적지 뷰컨트롤러 저장
        let dstUVC = self.destination
        
        //from에서 to로 view 전환
        UIView.transition(from: srcUVC.view,
                          to: dstUVC.view,
                          duration: 2,
                          options: .transitionCurlDown,
                          completion: nil)
    }
}
