import UIKit

// Optional : 값을 가지지 않아도 되는 형식
let optionalNum: Int? = nil

// Unwrapping
var num: Int? = nil
print(num)
num = 123
print(num)

let n = 123
print(n)

// Forced Unwrapping
print(num)
print(num!)

// 다만 경고를 출력하기 때문에, 꺼낼 값이 있을 때만 출력할 수 있도록 아래처럼 사용한다.
if num != nil {
  print(num!)
}

num = 123
let before = num        //before에 옵셔널 타입으로 그대로 저장
let after = num!        // 강제로 Unwrapping 하며 일반 Int로 저장된다.
