//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by 이동규 on 2021/09/21.
//

import UIKit

class ViewController: UIViewController {

    // 화면표시 아울렛
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
 /*
    // 전달받을 프로퍼티
    var paramEmail: String?
    var paramUpdate: Bool?
    var paramInterval: Double?
*/
    
    // 화면이 표시될 때마다 실행되는 메소드
    override func viewWillAppear(_ animated: Bool) {
        NSLog("\n=== viewWillAppear called ===")
        /*
        if let email = paramEmail {
            resultEmail.text = email
        }
        if let update = paramUpdate {
            resultUpdate.text = (update == true ? "자동갱신" : "미갱신")
        }
        if let interval = paramInterval {
            resultInterval.text = "\(Int(interval))분 마다"
        }
        */
        //AppDelegate 객체 쓰기
        let ad = UIApplication.shared.delegate as? AppDelegate
//        print(ad?.paramEmail, ad?.paramInterval)
        if let email = ad?.paramEmail {
            resultEmail.text = email
            NSLog(resultEmail.text!)
        }
        if let update = ad?.paramUpdate {
            resultUpdate.text = (update == true ? "자동갱신" : "미갱신")
            NSLog(resultUpdate.text!)
        }
        if let interval = ad?.paramInterval {
            resultInterval.text = "\(Int(interval))분 마다"
            NSLog(resultInterval.text!)
        }
    }
    
}

