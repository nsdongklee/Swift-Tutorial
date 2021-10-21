//
//  ViewController.swift
//  LoginSample
//
//  Created by 이동규 on 2021/10/19.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var userModel = UserModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        passwordTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        loginButton.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
    }
    @IBAction func didTapLoginButton(_ sender: Any) {
        guard let email = self.emailTextField.text, let password = self.emailTextField.text else {
            return
        }
        if userModel.isValidEmail(id: email) && userModel.isValidPassword(pwd: password) {
            
        }
    }
    
    // 로그인 체크
    func loginCheck(id: String, pwd: String) -> Bool {
        for user in userModel.users {
            if user.email == id && user.password == pwd {
                return true
            }
        }
        return false
    }
    
    // 텍스트필드 흔들기 애니메이션
    func shakeTextField(_ textField: UITextField) -> () {
        UIView.animate(withDuration: 0.1, animations:
                        { textField.frame.origin.y -= 5 }, completion: {_ in
            UIView.animate(withDuration: 0.1, animations:
                            { textField.frame.origin.y += 10}, completion: {_ in
                UIView.animate(withDuration: 0.1, animations: {
                            textField.frame.origin.y -= 5
                })
            })
        })
    }
    
    // 다음 누르면 입력창 넘어가기 완료 누르면 키보드 내려가기
    @objc func didEndOnExit(_ sender: UITextField) {
        if self.emailTextField.isFirstResponder {
            passwordTextField.becomeFirstResponder()
        }
    }
    
    
    
    
    
}

