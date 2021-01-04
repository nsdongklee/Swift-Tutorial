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
