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
    
    // 전달받을 프로퍼티
    var paramEmail: String?
    var paramUpdate: Bool?
    var paramInterval: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    // 화면이 표시될 때마다 실행되는 메소드
    override func viewWillAppear(_ animated: Bool) {
        if let email = paramEmail {
            resultEmail.text = email
        }
        if let update = paramUpdate {
            resultUpdate.text = (update == true ? "자동갱신" : "미갱신")
        }
        if let interval = paramInterval {
            resultInterval.text = "\(Int(interval))분 마다"
        }
    }
    
}

