import UIKit

class Figure {
    var name = "Unknown"
    init(name: String) {
        self.name = name
    }
    func draw() {
        print("draw \(name)")
    }
}

// 상속할 클래스 이름을 지정
class Circle: Figure {
    var radius = 0.0
    
    // Super class 에 있는 함수와 동일한 함수를 오버라이딩
    override func draw() {
        super.draw()    // 오버라이딩 메소드 내부에서 함수를 실행하려고 할 때
        print("🐙")
    }
}

let c = Circle(name: "circle")
c.radius
c.name
c.draw()

// 속성을 오버라이딩 해보기, 읽기 쓰기가 가능한 속성은 그에 맞추어야한다.
class Oval: Circle {
    override var radius: Double {
        get {
            return super.radius
        }
        set {
            super.radius = newValue
        }
    }
}





// final class 는 상속이 금지
final class Rectangle: Figure {
    var width = 0.0
    var height = 0.0
}
class Square: Rectangle {
    // ...
}
