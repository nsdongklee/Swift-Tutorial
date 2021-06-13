import UIKit

// 프로토콜은 최소한의 정의만 한다. 구현은 하지 않음
protocol Sendable {
    var from: String? { get }
    var to: String? { get }
    func send()
}

//클래스나 구조체에 프로토콜을 적용할 수 있다. 다만, 적용하면 프로토콜에 있는 속성과 메소드 다 구현해야함
struct Mail: Sendable {
    var from: String?
    var to: String?
    func send() {
        print("Send a mail from \(self.from!) to \(self.to!)")
    }
}

let mail = Mail(from: "you", to: "me")
mail.send()

//Any와 AnyObject 그리고 다운캐스팅(타입캐스팅) 이해해보기
//Any는 모든 타입에 대응하고, AnyObject는 모든 객체에 대응한다.
let anyNumber: Any = 10
let anyString: Any = "test"
let anyInst: AnyObject = Mail() as AnyObject

//anyNumber + 1 // 컴파일 에러!

//Any 타입은 다양한 타입을 수용하기 때문에 숫자가 아닐수도 있는 것에 대비해 다운 캐스팅을할 때 옵셔널로 해준다.
let number: Int? = anyNumber as? Int
//타입 검사
print(anyNumber is Int)
