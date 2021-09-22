//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by 이동규 on 2021/09/21.
//

import Foundation
import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    
    @IBAction func onSubmit(_ sender: Any) {
/*
//        // presentingViewController 속성으로 이전 화면 객체를 읽어오고, 해당 객체로 타입캐스팅
//        let preVC = self.presentingViewController
//        guard let vc = preVC as? ViewController else {
//            return
//        }
//        // 값 전달
//        vc.paramEmail = self.email.text
//        vc.paramUpdate = self.isUpdate.isOn
//        vc.paramInterval = self.interval.value
        // 이전 화면으로 복귀
//        self.presentingViewController?.dismiss(animated: true, completion: nil)
*/
        
        // 1. AppDelegate 객체 인스턴스를 가져온다.
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        // 2. 값을 저장한다.
        ad?.paramEmail = self.email.text
        ad?.paramUpdate = self.isUpdate.isOn
        ad?.paramInterval = self.interval.value
//        print(ad?.paramUpdate, ad?.paramEmail, ad?.paramInterval)
        
        // 3. 이전 화면으로 복귀
        self.presentingViewController?.dismiss(animated: true)
    }

}
