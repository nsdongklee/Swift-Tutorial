import UIKit

class Person {
    var name: String
    var yearOfBirth: Int
    
    init(name: String, year:Int) {
        self.name = name
        self.yearOfBirth = year
    }
    // Computed Property
    var age: Int {
        get {
            let calendar = Calendar.current
            let now = Date()
            let year = calendar.component(.year, from: now)
            return year - yearOfBirth
        }
        set {
            let calendar = Calendar.current
            let now = Date()
            let year = calendar.component(.year, from: now)
            yearOfBirth = year - newValue
        }
    }
}

let p = Person(name: "John", year: 2002)
p.age

//class Color {
//   let red: Int
//   let green: Int
//   let blue: Int
//
//   init(red: Int, green: Int, blue: Int) {
//      self.red = red
//      self.green = green
//      self.blue = blue
//   }
//
//   // 여기에 계산 속성을 추가해 주세요.
//    var complementary: Color {
//        return Color(red: 255 - self.red, green: 255 - self.green, blue: 255 - self.blue)
//    }
//}
//
//let color = Color(red: 95, green: 199, blue: 205)
//let complementaryColor = color.complementary
//
//print(complementaryColor.red, complementaryColor.green, complementaryColor.blue)
//

// Property Observer: 속성 감시자
class Size1 {
    var width = 0.0 {
        willSet {
            print(width, "=>", newValue)    // 현재 값과 새로운 값 출력
        }
        didSet {
            print(oldValue, "=>", width)
        }
    }
}
let s = Size()
s.width = 123
s.width = 234
s.width

class Color {
   let red: Int
   let green: Int
   let blue: Int
   
   init(red: Int, green: Int, blue: Int) {
      self.red = red
      self.green = green
      self.blue = blue
   }
   
   // 여기에서 형식 속성을 추가해 주세요.
    static var white: Color {
        return Color(red: 255, green: 255, blue: 255)
    }
    static var black: Color {
        return Color(red: 0, green: 0, blue: 0)
    }
}
let white = Color.white
let black = Color.black


// self and super
class Size2 {
    var width = 0.0
    var height = 0.0
    
    func calcArea() -> Double {
        return width * height       // self 없이 속성에 접근
    }
    var area: Double {
        return calcArea()           // 메소드 호출시 self 생략
    }
    func update(width: Double, height: Double) {
        self.width = width          // self 를 명시하여 파라미터를 구분
        self.height = height
    }
    func doSomething() {
        let c = {self.width * self.height }
    }
    static let unit = ""
    // 형식메소드는 인스턴스에 직접 접근 불가
    static func doSomething() {
        //self.width
        self.unit
    }
}

struct Size3 {
    var width = 0.0
    var height = 0.0
    
    mutating func reset(value: Double) {
        // 인스턴스가 새로운 인스턴스로 교체된다.
        self = Size3(width: value, height: value)
    }
}

