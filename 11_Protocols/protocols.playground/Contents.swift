import UIKit

protocol Something {
    func doSomething()
}

// Adopting Protocol
struct Size: Something {
    func doSomething() {
        //
    }
}

// Class-only Protocols
protocol SomethingObject: AnyObject, Something {
    // ...
}

class Object: SomethingObject {
    func doSomething() {
        // ...
    }
}

//// Property requirements
//protocol Figure {
//    static var name: String { get set }
//}
//
//struct Rectangle: Figure {
//    static var name = "Rect"
//}
//
//class Circle: Figure {
//    static var name = String {
//        get {
//            return "Circle"
//        }
//        set {
//            // ...
//        }
//    }
//}


// Method requirements
protocol Resettable {
    mutating func reset()
}

class Size2: Resettable {
    var width = 0.0
    var height = 0.0
    
    func reset() {
        width = 0.0
        height = 0.0
    }
}

// 값 형식의 메소드에서 속성값을 바꾸려면 mutating 키워드를 추가해야한다.
struct Size3: Resettable {
    var width = 0.0
    var height = 0.0
    
    mutating func reset() {
        width = 0.0
        height = 0.0
    }
}

// Initializer requirements
protocol Figure {
    var name: String { get }
    init(n: String)
}

struct Rectangle: Figure {
    var name: String
    
    init(n: String) {
        name = n
    }
}

class Circle: Figure {
    var name: String
    
    required init(n: String) {
        name = n
    }
}

// 상속을 고려하지 않는 클래스는 required 키워드가 불필요하다.
final class Triangle: Figure {
    var name: String
    
    init(n: String) {
        name = n
    }
}

//class Oval: Circle, Figure {    // 중복선언은 허용하지 않는다.
//    // ...
//}

class Oval: Circle {    // 중복선언은 허용하지 않는다.
    var prop: Int
    
    init() {
        prop = 0
        super.init(n: "Oval")
    }
    required convenience init(n: String) {
        self.init()
    }
}

protocol Grayscale {
    init?(white: Double)
}

struct Color: Grayscale {
    init(white: Double) {
        // ...
    }
}

// Subscript requirements
protocol List {
    subscript(idx: Int) -> Int { get }
}

struct DataStore: List {
    subscript(idx: Int) -> Int {
        get {
            return 0
        }
        set {
            // ...
        }
    }
}


