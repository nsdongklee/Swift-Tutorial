//
//  ViewController.swift
//  AlertSample
//
//  Created by 이동규 on 2021/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var messageLabel: UILabel!
    @IBAction func AlertButton(_ sender: Any) {
        
        // 1. 알람객체 인스턴스 생성
        let alert = UIAlertController(title: "알림", message: "알림 메시지 작성란", preferredStyle: .alert)
        // 2. 알람객체에 들어갈 버튼 생성
        let ok = UIAlertAction(title: "확인", style: .default) { _ in
            NSLog("확인버튼의 handler 실행")
            //텍스트 필드를 추가한 알람일 때 확인 버튼 누르면 데이터 받는 방법
            if let tf = alert.textFields?[0] {
                self.messageLabel.text = "텍스트 필드에 입력된 값은 \(tf.text!)"
            } else {
                print("입력된 값이 없다.")
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        // 3. 메시지 창 컨트롤러에 버튼 액션 추가
        alert.addAction(ok)
        alert.addAction(cancel)
        
        // 만약 텍스트 필드를 추가하고 싶다?
        alert.addTextField { (tf) in
            tf.placeholder = "텍스트필드 입력란에 안내 설명"
            tf.isSecureTextEntry = true
        }
        
        // 4. 메시지 창 컨트롤러를 표시
        self.present(alert, animated: true, completion: nil)
    }
    
    // 텍스트 필드 + 알람을 이용해서 로그인 기능 만들어 보기
    @IBAction func loginAuth(_ sender: Any) {
        let alert = UIAlertController(title: "로그인",
                                      message: "정확하게 입력해보세요.",
                                      preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            let loginID = alert.textFields?[0].text
            let loginPW = alert.textFields?[1].text
            
            if loginID == "dongklee" && loginPW == "42" {
                self.messageLabel.text = "인증 완료"
            } else {
                self.messageLabel.text = "인증 미완료"
            }
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        //ID 입력 텍스트필드 추가
        alert.addTextField { (tf) in
            tf.placeholder = "아이디 입력"
            tf.isSecureTextEntry = false
        }
        //PW 입력 텍스트필드 추가
        alert.addTextField { (tf) in
            tf.placeholder = "패스워드 입력"
            tf.isSecureTextEntry = true
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
}

