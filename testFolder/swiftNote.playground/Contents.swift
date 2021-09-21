import UIKit

var list: Array<String> = ["test", "logo", "hello"]

var cities = Array(repeating: "None", count: 3)

let tupleVal = ("a", "b", 1, 2.5, true)

tupleVal.0

// 하위클래스에서 override init 하려면 super.init(~) 해줘야함,, 안그러면 호출 안됨... cpp랑 좀 다르네 (Initializer does not override a designated initializer from its superclass)
class BaseDad {
    var baseValue: Double
    init(inputValue: Double) {
        self.baseValue = inputValue
    }
}

class BaseMom {
    var anotherValue: Double
    init(anotherValue: Double) {
        self.anotherValue = anotherValue
    }
}

class ExBase: BaseDad {
    var exValue: Double
//    override init(inputValue: Double) {
//        self.exValue = 1.0
//        super.init(inputValue: 10.5)
//    }
    init(exValue: Double) {
        self.exValue = exValue
        super.init(inputValue: 50.1)    // 자식 클래스에서 커스텀 생성자를 따로 구현하려면 이런 방식으로. 근데 그전에 현재 클래스 프로퍼티 먼저 초기화를 해야됨...(왜..?)
    }
}

var test: ExBase = ExBase(exValue: 3.0)
//print(test.exValue, test.baseValue)


let f = { () -> Void in
    print("closure test")
}
f()

//// 클래스와 구조체
class CPosition {
    var x: Double = 1.0
    var y: Double = 1.0
}

let cp = CPosition()
cp.x
cp.y

// 값 바꾸기 시도
cp.y = cp.y + 1.0
cp.y



struct SPosition {
    var x: Double = 1.0
    var y: Double = 1.0
}

var sp = SPosition()
sp.x
sp.y

// 값 바꾸기 시도
sp.y = sp.y + 1.0
sp.y

//복사생성자, 할당연산자 실험해보기
var tmp = CPosition()
tmp.y = 100
tmp.y
var testcp = tmp
testcp.x
testcp.y

var listCp = [CPosition]()
if listCp != nil {
    print("yes")
} else {
    print("no")
}
