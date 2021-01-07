import UIKit

// Original
func swapInt(lhs: inout Int, rhs: inout Int) {
    let temp = lhs
    lhs = rhs
    rhs = temp
}
var aa = 1
var ba = 2
swapInt(lhs: &aa, rhs: &ba)

// Generic and Type Constraints
func swapValue<T: Equatable>(lhs: inout T, rhs: inout T) {
    // Adaopting Type Constraints
    if lhs == rhs {
        return
    }
    
    let temp = lhs
    lhs = rhs
    rhs = temp
}

swapValue(lhs: &aa, rhs: &ba)
aa
ba


// Sample Subject

// 여기에서 제네릭 함수를 구현해 주세요.
func equal<T: Equatable>(lhs: T, rhs: T) -> Bool {
    if lhs == rhs {
        return true
    } else {
        return false
    }
}
// Color 값을 비교할 수 있도록 구현해 주세요.
struct Color: Equatable {
   let r: Double
   let g: Double
   let b: Double
}

let a = equal(lhs: 1, rhs: 1)
let b = equal(lhs: 12.34, rhs: 12.34)
let c = equal(lhs: "Hello", rhs: "Hello")
let d = equal(lhs: Color(r: 0, g: 0, b: 0), rhs: Color(r: 0, g: 0, b: 0))

print(a && b && c && d)
