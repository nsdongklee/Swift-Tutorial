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

// Switch Statement
let temp = 0

switch temp {
case 1:
    print("one")
case 2, 3:
    print("two or three")
default:
    print("??")    // break
}

// Switch Statement(Interval matching)
let temperature = -8

switch temperature {
case ...10:
    print("cold")
case 11 ... 20:
    print("cool")
case 21 ... 27:
    print("warm")
default:
    print("hot")
}

let weekday: Int = 6
func solution(_ weekday: Int) -> String {
    var ret: String = ""
    
    switch weekday {
    case 0:
        ret = "일요일"
    case 1:
        ret = "월요일"
    case 2:
        ret = "화요일"
    case 3:
        ret = "수요일"
    case 4:
        ret = "목요일"
    case 5:
        ret = "금요일"
    case 6:
        ret = "토요일"
    default:
        break
    }
    return ret
}

solution(weekday)

// guard statement
guard <#condition#> else {
    <#statements#>
}
