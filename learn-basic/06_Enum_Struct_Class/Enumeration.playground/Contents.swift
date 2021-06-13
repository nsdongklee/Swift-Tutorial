import UIKit

// 열거형: Enumeration
let left = "left"
let right = "right"
let center = "center"

var align = center      // 가독성이 좋지않음

enum Alignment {    // 열거형 선언
    case left
    case right
    case center
}

Alignment.center
var textAlignment = Alignment.center
textAlignment = .left   // 앞에서 이미 열거형 변수로 저장, 생략하고 dot부터 시작해도 된다.

// statement 와 활용
if textAlignment == .center {
    print("yes")
}

switch textAlignment {
case .left:
    print("left")
case .right:
    print("right")
case .center:
    print("center")
default:
    break
}

enum Align: Int {    // 원시값을 가지는 열거형 선언
    case left
    case right
    case center
}

Align.left.rawValue
Align.right.rawValue
Align.center.rawValue

Align(rawValue: 0)
Align(rawValue: 20)

enum Weekday: String {
    case sunday
    case monday = "MON"
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}
Weekday.sunday.rawValue
Weekday.monday.rawValue

// Character 로 원시값 타입을 지정하면 반드시 값을 지정해줘야함
enum ControlChar: Character {
    case tab = "\t"
    case newLine = "\n"
}

// Sample test
enum HttpStatusCode: Int{
    case ok = 200
    case badRequest = 400
    case unauthorized = 401
    case notFound = 404
    case internalServerError = 500
    case badGateway = 502
}
func solution(_ statusCode:Int) -> String {
   // 여기에서 인스턴스를 생성하고 메시지를 리턴해 주세요.
    var result: String = ""
    let status = HttpStatusCode(rawValue: statusCode)
    switch status {
        case .ok:
        result = "OK"
        case .badRequest:
        result = "Bad Request"
        case .unauthorized:
        result = "Unauthorized"
        case .notFound:
        result = "Not Found"
        case .internalServerError:
        result = "Internal Server Error"
        case .badGateway:
        result = "Bad Gateway"
        default:
        result = "Unsupported Code"
    }
    return result
}
solution(404)
