import UIKit

class Figure {
   var width: Double
   var height: Double
    var isSquare: Bool = true
    
   init(width: Double, height: Double) {
      self.width = width
      self.height = height
   }
   
   func area() -> Double {
      return width * height
   }
}

// 여기에서 Rectangle 클래스를 선언해 주세요.
class Rectangle : Figure {
    override var width: Double {
        get {
            return super.width
        }
        set {
            super.width = newValue
        }
    }
    override var height: Double {
        get {
            return super.height
        }
        set {
            super.height = newValue
        }
    }
    override func area() -> Double {
        return width * height
     }
    override var isSquare: Bool {
        get {
            return super.height == super.width
        }
        set {
            super.isSquare = newValue
        }
    }
}

// 여기에서 Circle 클래스를 선언해 주세요.
class Circle: Figure {
    var radius = 0.0
    let pi = Double.pi
    
    override var width: Double {
        get {
            return super.width
        }
        set {
            super.width = newValue
        }
    }
    override var height: Double {
        get {
            return super.height
        }
        set {
            super.height = newValue
        }
    }
    override func area() -> Double {
        return self.radius * self.radius * pi
    }
}
// 여기에서 Triangle 클래스를 선언해 주세요.
class Triangle: Figure {
    override var width: Double {
        get {
            return super.width
        }
        set {
            super.width = newValue
        }
    }
    override var height: Double {
        get {
            return super.height
        }
        set {
            super.height = newValue
        }
    }
    override func area() -> Double {
        return 0.5 * width * height
    }
}

// 아래에 있는 코드는 수정하지 마세요.
var validCount = 0

let r = Rectangle(width: 100, height: 200)
if r.area() == 20000 {
   validCount += 1
}

if !r.isSquare {
   validCount += 1
}

let c = Circle(width: 100, height: 200)
c.radius = 60
if Int(c.area()) == 11309 {
   validCount += 1
}

let t = Triangle(width: 100, height: 200)
if t.area() == 10000 {
   validCount += 1
}


print(validCount == 4)
