//
//  CustomTabBarController.swift
//  VC
//
//  Created by 이동규 on 2021/01/30.
//  Copyright © 2021 Keun young Kim. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizableViewControllers = Array(customizableViewControllers!.dropFirst(2))
    delegate = self
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension CustomTabBarController: UITabBarControllerDelegate {
    
    // 탭을 선택할 때 마다 호출됨
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        // 두번째 뷰 컨트롤러라면 선택할 수 없도록
        if let secondVC = tabBarController.viewControllers?[1] {
            return viewController != secondVC
        }
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //
    }
}
