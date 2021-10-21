//
//  UserModel.swift
//  LoginSample
//
//  Created by 이동규 on 2021/10/19.
//

import Foundation

struct User {
    var email: String
    var password: String
}

final class UserModel {
    
    var users: [User] =  [
        User(email: "lee@gmail.com", password: "qwer1234"),
        User(email: "park@gmail.com", password: "1q2w3e4r")
    ]
    
    func isValidEmail(id: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailCheck = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailCheck.evaluate(with: id)
    }
    
    func isValidPassword(pwd: String) -> Bool {
        let passwordRegEx = "^[a-zA-Z0-9]{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordCheck.evaluate(with: pwd)
    }
}
