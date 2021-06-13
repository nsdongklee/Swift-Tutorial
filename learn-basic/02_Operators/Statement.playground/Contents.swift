import UIKit

var str = "Hello, playground"

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
guard 1 < 2 else {
    //return
}

for idx in 1 ... 5 {
    print(idx)
}

for num in stride(from: 0, to: 10, by: 2) {
    print(num)
}

let list = ["do", "something", "whatever"]
for i in list {
    print(i)
}

// Control transfer statements

for idx in 1 ... 100 {
    print("start")
    if idx < 5 {
        continue
    }
    if idx > 10 {
        break
    }
    print("end")
}

// break statement with switch
let nn = 2

switch nn {
case 1 ... 10:
    print("begin")
    if nn % 2 != 0 {
        break
    }
    print("end block")
default:
    break       // Use 'break' preferably when do nothing
}

for idx in 1 ... 10 {
    if idx % 2 == 0 {
        continue
    }
    print(idx)
}

// Labled Statement
outer: for i in 1 ... 3 {
    print("outer loop", i)
    for j in 1 ... 3 {
        print(" inner loop", j)
        break outer
    }
}
