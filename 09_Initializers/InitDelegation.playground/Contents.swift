import UIKit

// Initializer Delegation, Struct
struct Size {
    var width: Double
    var height: Double
    
    init(w: Double, h: Double) {
        width = w
        height = h
    }
    // Initializer Delegation
    init(value: Double) {
        self.init(w: value, h: height)
    }
}

// Initializer Delegation, Class
class Figure {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "unknown")
    }
}
class Rectangle: Figure {
    var width = 0.0
    var height = 0.0
    
    // Delegate up
    init(n: String, w: Double, h: Double) {
        width = w
        height = h
        super.init(name: n)
    }
    
    // 동일한 클래스에서 호출
    convenience init(value: Double) {
        self.init(n: "rect", w: value, h:value)
    }
}

class Square: Rectangle {
    convenience init(value: Double) {
        self.init(n: "square", w: value, h: value)
    }
    // 바로 위의 init()을 호출
    convenience init() {
        self.init(value: 0.0)
    }
}
