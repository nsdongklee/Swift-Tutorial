import UIKit

//익스텐션: 계속 무언가 추가로 덧붙이는 느낌

//구조체만들고 익스텐션 추가
struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}
extension Size {
    var area: Double {
        return width * height
    }
}
let ss1 = Size(width: 100, height: 100)
ss1.width
ss1.area
ss1.width == ss1.height
// 구조체,객체는 기본적으로 비교가 불가하다 그래서 해당 프로토콜을 가져야함. 아래처럼 하면 도형이 똑같은지 비교할 수 있다.
extension Size: Equatable {
    public static func == (lhs: Size, rhs: Size) -> Bool {
        return lhs.width == rhs.width && lhs.height == lhs.height
    }
}
let ss2 = Size(width: 100, height: 100)
ss1 == ss2

