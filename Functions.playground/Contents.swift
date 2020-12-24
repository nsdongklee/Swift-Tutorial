import UIKit

// Defining Func
func sayHello() {           // Non return value
    print("hello, swift")
}

// Calling Func
sayHello()

func add() -> Int {
    return 1 + 2
}
let res = add()
print(res)

if add() == 3 {
    print("three")
}

func doSomething() {
    let rnd = Int.random(in: 1 ... 10)
    if rnd % 2 == 1 {
        return
    }
    print(rnd)
}
doSomething()

// Using parameters
func newAdd(a: Int, b: Int) -> Int {
    // a = 12  Error(파라미터로 들어오는 변수는 임시 상수가 된다.)
    return a + b
}
newAdd(a: 12, b: 34)

// Default Value
func sayHi(to: String = "Stranger") {
    print("Hello, \(to)")
}
sayHi(to: "Swift")
sayHi()

// Argument Label
func sayHello2(name: String) {
    print("Hello, \(name)")
}
sayHello2(name: "Swift")

func sayHello3(to name: String) {
    print("Hello, \(name)")     // Label 을 붙이고 위의 함수와 동일하게 변수명을 사용하여도 에러를 출력하지 않는다. Argument Label은 함수를 호출할 때 쓴다.
}
sayHello3(to: "Swift")

// Label 생략(와일드카드 패턴 사용)
func sayHello4(_ name: String) {
    print("Hello, \(name)")
}
sayHello4("Swift")

