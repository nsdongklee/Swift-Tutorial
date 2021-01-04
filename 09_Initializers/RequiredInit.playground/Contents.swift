import UIKit

class Figure {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
    func draw() {
        print("draw\(name)")
    }
}

// name 파라미터를 받는 init 을 직접 구현하도록 하려면
class Rectangle: Figure {
    var width: Double = 0.0
    var height: Double = 0.0
    
    required init(name: String) {
        width = 0.0
        height = 0.0
        super.init(name: name)
    }
}
