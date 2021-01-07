import UIKit

struct Color<T> {
    var red: T
    var green: T
    var blue: T
}

// 서로 다른 구조체를 호출한 것과 같다.
var c = Color(red: 128, green: 80, blue: 200)
var d = Color(red: 128.0, green: 80.0, blue: 200.0)

let arr: Array<Int>
let dict: Dictionary<String, Double>

// 익스텐션으로 제너릭 확장
extension Color /* Where: FixedWidthInteger */ {
    func getComponents() -> [T] {
        return [red, green, blue]
    }
}

let intColor = Color(red: 1, green: 2, blue: 3)
intColor.getComponents()

let dbColor = Color(red: 1.0, green: 2.0, blue: 3.0)
dbColor.getComponents()

// Associated Types: 프로토콜을 제너릭 타입으로 선언하기
protocol QueueCompatible {
    associatedtype Element
    func enqueue(value: Element)
    func dequeue() -> Element?
}
