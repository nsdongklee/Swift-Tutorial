import UIKit

// Overflow Operator
Int8.min
Int8.max

//let num: Int8 = Int8.max + 1    // Error

// Overflow Addition Operator(&+)
let a: Int8 = Int8.max
let b: Int8 = a &+ 1

// Overflow Subtraction Operator(&-)
let c: Int8 = Int8.min
let d: Int8 = a &- 1

// Overflow Multiplication Operator(&*)
let e: Int8 = Int8.max &* 2

// Logical Operators
!true

let num1 = 12
let num2 = 34

(num1 < num2) == true

// Ternary Operator
let hour = 12

hour < 12 ? "am" : "pm"

// Short-circuit Evaluation
var n1 = 1
var n2 = 1

func updateLeft() -> Bool {
    n1 += 1
    return true
}

func updateRight() -> Bool {
    n2 += 1
    return true
}

if updateLeft() || updateRight() {
    
}
n1
n2

// Bitwise Operators
let b1: UInt8 = 0b0010_0010
let b2: UInt8 = 0b1101_1111

b1 & b2
b1 | b2
b1 ^ b2
~b1

// Range Operators
var sum = 0
for num in 1 ... 10 {
    num
    sum += num
}
sum

let list = ["a", "b", "c", "d", "e"]
list[2...]
list[...2]

// Others
let range = ...5    //lowerbound 는 무한대가 된다.
range.contains(7)
range.contains(1)

