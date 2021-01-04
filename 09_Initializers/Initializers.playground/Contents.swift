import UIKit

class Position {
    var x = 0.0 // 기본 초기화
    var y: Double
    var z: Double? = nil
    
    init() {    // 메소드로 초기화, 기본 초기화 방법으로 모두 초기화 하면 디폴트로 실행됨
        y = 0.0
    }
}

class SizeObj {
    var width = 0.0
    var height = 0.0
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    convenience init(value: Double) {
        self.init(width: value, height: value)
    }
}

// Memberwise Initializer
struct SizeValue {
    var width = 0.0
    var height = 0.0
}
let s = SizeValue()

SizeValue(width: 1.2, height: 3.4) // Memberwise Initializer

// Initializer Inheritance
class Figure {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    func draw() {
        print("draw\(name)")
    }
}

class Rectangle: Figure {
    var width: Double = 0.0
    var height: Double = 0.0
    
    init(name: String, width: Double, height: Double) {
        // self.name = name >> 상속되지 않기 때문에 에러
        self.width = width
        self.height = height
        super.init(name: name)
    }
    // Designated 방식으로 override 초기화
    override init(name: String) {
        width = 0
        height = 0
        super.init(name: name)
    }
    // convenience init() 은 항상 동일한 클래스에 있는 init()을 호출한다.
    convenience init() {
        self.init(name: "unknown")
    }
}

