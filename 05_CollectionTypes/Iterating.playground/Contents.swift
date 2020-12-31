import UIKit

print("Array", "=================")
let arr = ["a", "b", "c"]
for e in arr {
    print(e)
}

print("Set", "=================")
let set: Set = [1, 2, 2, 3]
for n in set {
    print(n)  // 정렬되지 않은 형태이기 때문에 마구잡이 출력됨
}

print("Dict", "=================")
let dict = ["a": 1, "b": 2, "c": 3]
for (key, value) in dict {
    print(key, value)
}

// forEach 메소드
print("Array", "=================")
let arr2 = ["a", "b", "c"]
arr2.forEach { (e) in
    print(e)
}

print("Set", "=================")
let set2: Set = [1, 2, 2, 3]
set.forEach { (num) in
    print(num)
}

print("Dict", "=================")
let dict2 = ["a": 1, "b": 2, "c": 3]
dict2.forEach { (elem) in
    print(elem.key, elem.value)
}

// 함수로 보는 for-in 반복문과 forEach 메소드의 차이
func withForIn () {
    print("#Function")
    let arr = [1, 2, 3]
    for n in arr {
        print(n)
        return
    }
}

func withForEach () {
    print("#Function")
    let arr = [1, 2, 3]
    arr.forEach { (num) in
        print(num)
        return
    }
}

withForIn()
withForEach()
