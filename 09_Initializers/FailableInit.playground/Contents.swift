import UIKit

// 초기화 실패 시, 옵셔널로 처리하는 방법
struct Position {
    let x: Double
    let y: Double
    
    init?(x: Double, y: Double) {
        guard x >= 0.0, y >= 0.0 else { return nil }
        self.x = x
        self.y = y
    }
    
    init!(value: Double) {
        guard value >= 0.0 else { return nil }
    self.x = value
    self.y = value
    }
    // 오버로딩은 failable 을 구별하지 않는다
}

var a = Position(x: 12, y: 34)
a = Position(x: -12, y: 0)
var b = Position(value: 12)
b
// 초기화 실패 시, nil 리턴
b = Position(value: -12)

// Deinitializer: 소멸자

