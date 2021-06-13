import UIKit

var str = "Hello, playground"

// 숫자 리터럴 (Number Literals)
let temp = 1.23e4   // 지수 표현
let base16 = 0xAp2  // 16진수 표현
let price = 1_000_000 // 금액 표기(1,000,000 $)

let binaryBase = 0b1010  // 10을 이진수로
let octBase = 0o12       // 8진수로
let base_16 = 0xA         // 16진수로

// Integer Types (Int8, ..., Int64)
Int8.min
Int8.max
UInt8.max

MemoryLayout<Int>.size // 메모리 공간의 크기를 알고 싶을 때

// Integer Types (Float, Double)
let pi: Float =
    3.141592653
print(pi)

let pi_2: Double =
    3.141592653
print(pi)

// Boolean Types (true, False)
let isValid: Bool = false
let strNew = ""
strNew.isEmpty

// Strings and Characters
let strOne = "1"
type(of: strOne)

let ch: Character = "1"
type(of: ch)

let doubleCh: Character = " "//"aa"

let emptyCh: Character = " "
