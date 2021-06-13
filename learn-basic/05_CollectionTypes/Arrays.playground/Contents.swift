import UIKit

// array Literal
let temp = [1,2,3]
temp[0]

// 정식 문법 Array<Type>, 단축문법 [T]
let strArr: Array<String>
let strArr2: [String]

// Creating an Array
let nums = [1, 2, 3]
let emptyArr: [Int] = []
let emptyArr2 = Array<Int>()
let emptyArr3 = [Int]()
let zeroArr = [Int](repeating: 0, count: 10)    // 초기값을 가진 배열로 생성됨

// Inspecting an Array
nums.count
nums.count == 0
nums.isEmpty

// Accessing Elements
let fruits = ["Apple", "Banana", "Melon"]
fruits[0]
fruits[1 ... 2]

fruits[fruits.startIndex]
fruits[fruits.index(before: fruits.endIndex)]

fruits.first
fruits.last

emptyArr.first
emptyArr.last

// Adding Elements
var alphabet = ["A", "B", "C"]
alphabet.append("E")    // 같은 자료형만 추가할 수 있음
alphabet.append(contentsOf: ["F", "G"]) //여러 요소를 추가하고 싶을 때 옵션을 준다.
alphabet.insert("D", at: 3)
alphabet.insert(contentsOf: ["a", "b", "c"], at: 0)

alphabet[0 ... 2] = ["x", "y", "z"]     // subscript 방식으로
alphabet.replaceSubrange(0 ... 2, with: ["a", "b", "c"])

alphabet[0 ..< 3] = []  // 빈 배열로 바꾸면 삭제 효과를 볼 수 있다.
alphabet

// Removing Elements
alphabet = ["A", "B", "C", "D", "E", "F", "G"]
alphabet.remove(at: 2)  // 인덱스로 삭제
alphabet
alphabet.removeFirst()
alphabet
alphabet.removeFirst(2) //빼는 값을 리턴하지 않음
alphabet
alphabet.popLast()  // 값이 없어도 오류를 리턴하지 않고 nil 을 리턴
alphabet
alphabet.removeAll()
alphabet

// 서브스크립트 삭제
alphabet = ["A", "B", "C", "D", "E", "F", "G"]
alphabet.removeSubrange(0 ... 2)
alphabet

alphabet[0 ... 2] = []
alphabet

// Comparing Arrays
let a = ["A", "B", "C"]
let b = ["a", "b", "c"]

a == b
a.elementsEqual(b)
a.elementsEqual(b) { (lhs, rhs) -> Bool in
    return lhs.caseInsensitiveCompare(rhs) == .orderedSame
}

// Finding Elements(요소 검색)
var numList = [1,2,3,4,5,6,6,7,8,8,9,0]
numList.contains(8)

// 짝수 있는지 클로저로 리턴
numList.contains { (n) -> Bool in
    return n % 2 == 0
}

// 검색된 첫 번째 요소(값)
numList.first { (n) -> Bool in
    return n % 2 == 0
}

// 검색된 첫 번째 요소(인덱스)
numList.firstIndex { (n) -> Bool in
    return n % 2 == 0
}

numList.firstIndex(of: 4)   // 해당 위치의 값
numList.lastIndex(of: 1)

// Sorting Array
numList.sorted()
numList     // 원본은 정렬이 안됨

numList.sorted { (a, b) -> Bool in
    return a > b
}

numList.sorted().reversed()
[Int](numList.sorted().reversed())
numList

var mutableNums = numList
mutableNums.sort()
mutableNums.reverse()
mutableNums

// Swap Element
mutableNums.swapAt(0, 1)

// Sample test
let list = ["iPad Pro", "iPhone Xs", "MacBook", "iPhone Xs MAX", "iPad", "MacBook Air", "iPhone Xr", "iPad Mini", "iPhone 8", "MacBook Pro", "iPhone 8 Plus", "iMac", "AirPods", "iMac Pro", "Magic Mouse 2", "Mac Pro", "Magic Keyboard", "Mac mini"]

// 여기에서 필터링 코드를 구현해 주세요.
var filtered = list.filter { $0.contains("iPhone")}
filtered.sort()
print(filtered == ["iPhone 8", "iPhone 8 Plus", "iPhone Xr", "iPhone Xs", "iPhone Xs MAX"])
