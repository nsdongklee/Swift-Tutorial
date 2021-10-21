//
//  UserModel.swift
//  segueSample
//
//  Created by 이동규 on 2021/10/19.
//

import Foundation

struct User {
    var nickname: String
    var cardID: String
}

class UserModel {
    
    // 유저 인스턴스 생성
    var users = [User]()
    
    // 유저랑 관련된 유틸 만들기
    func addUser(nickname: String, id: String) {
        self.users.append(User(nickname: nickname, cardID: id))
    }
}
