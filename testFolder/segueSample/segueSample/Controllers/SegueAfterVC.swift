//
//  SegueAfterVC.swift
//  segueSample
//
//  Created by 이동규 on 2021/10/19.
//

import Foundation
import UIKit

class SegueAterVC: UIViewController {
    
    @IBOutlet weak var nickname: UITextField!
    @IBOutlet weak var cardID: UITextField!
        
    @IBAction func saveButton(_ sender: Any) {
        NSLog("hello!!")
        // presentingViewController 속성으로 이전 화면 객체를 읽어오고, 해당 객체로 타입캐스팅
        guard let preVC = self.presentingViewController as? TableViewVC else {
            return
        }
        // 값 전달
        NSLog("hello??")
        if let nickname = self.nickname.text, let id = self.cardID.text {
            NSLog(nickname, id)
            preVC.userModel.addUser(nickname: nickname, id: id)
        }
        // 이전 화면으로 복귀
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func closeBarButton(_ sender: Any) {
        NSLog("hello close")
        self.dismiss(animated: true, completion: nil)
    }
}
