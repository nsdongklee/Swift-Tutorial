import UIKit

//Structure
struct Person {
    var name: String
    var age: Int
    
    func speak() {
        print("Hello")
    }
//    init() {
//        name = "Not Found"
//        age = 0
//    }
}
//let temp = Person()
//temp.name
//temp.age

let p = Person(name: "Steve", age: 29)
p.name
p.age
p.speak()


// Initializer Syntax
let str = "123"         // 생성자를 호출해서 초기값을 가지게 함
let num = Int(str)

class Position {
    var x: Double
    var y: Double
    
    init() {
        x = 0.0
        y = 0.0
    }
    
    init(value: Double) {
        x = value
        y = value
    }
}

let a = Position()
a.x
a.y

let b = Position(value: 100)
b.x
b.y

// Samlple Subject
// 여기에서 새로운 Color 구조체를 선언해 주세요.
struct Color {
    var red: Int
    var green: Int
    var blue: Int
    init() {
        red = 95
        green = 199
        blue = 205
    }
}

func solution(_ r:Int, _ g:Int, _ b:Int) -> String {
    // 여기에서 새로운 인스턴스를 생성해 주세요.
    let color = Color()
    let result: String = "R:\(color.red) G:\(color.green) B:\(color.blue)"

    // 여기에서 문자열을 리턴해 주세요.
    return result
}

class Color {
    var red: Int
    var green: Int
    var blue: Int
    init(red: Int, green: Int, blue:Int) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}

func solution(_ r:Int, _ g:Int, _ b:Int) -> String {
    // 여기에서 새로운 인스턴스를 생성해 주세요.
    let color = Color(red:r, green:g, blue:b)
    let result: String = "R:\(color.red) G:\(color.green) B:\(color.blue)"
    // 여기에서 문자열을 리턴해 주세요.
    return result
}
