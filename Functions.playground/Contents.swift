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
