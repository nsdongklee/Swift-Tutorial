import UIKit

// Uses
var dict = ["A": "Apple", "B": "Banana"]

let dict1: Dictionary<String, Int>
let dict2: [String: Int]

// Creating Dict
let words = ["A": "Apple", "B": "Banana", "C" : "City"]
print(words)
let tempDict: [String: String] = [:]

let tempDict2 = [String: String]()
let tempDict3 = Dictionary<String, String>()

// Inspeting Dict(배열과 유사)
words.count
words.isEmpty

// Accessing Keys and Values
words["A"]
words["Apple"]      // 키 값을 찾기 때문에 nil 을 리턴

let a = words["E"]
let b = words["E", default: "Empty"]    // 어떤 경우에도 값을 줄 수 있다.
print(words)
for k in words.values {
    print(k)
}

// Add Keys and Values
var wordList = [String: String]()

wordList["A"] = "Apple"
wordList["B"] = "Banana"
wordList

wordList["B"] = "Ball"      // 기존 값을 교체
wordList

wordList.updateValue("City", forKey: "C")   // 기존 값이 없으면 nil 리턴
wordList

wordList.updateValue("Circle", forKey: "C")
wordList

// Removing Keys and Values
wordList["B"] = nil
wordList

wordList.removeValue(forKey: "A")
wordList.removeValue(forKey: "A")

// Comparing
let aa = ["A": "Apple", "B": "Banana", "C" : "City"]
let bb = ["A": "Apple", "C" : "City", "B": "banana"]

aa == bb    // 순서 상관 없이, 값이 같아야 함

// 딕셔너리는 항상 동일한 순서로 전달되지 않는다.
aa.elementsEqual(bb) { (lhs, rhs) -> Bool in
    print(lhs.key, rhs.key)
    return lhs.key.caseInsensitiveCompare(rhs.key) == .orderedSame &&
        lhs.value.caseInsensitiveCompare(rhs.value) == .orderedSame
}

// 정렬된 키를 기준으로 비교할 수 있다.
let akeys = aa.keys.sorted()
let bkeys = bb.keys.sorted()

akeys.elementsEqual(bkeys) { (lhs, rhs) -> Bool in
    guard lhs.caseInsensitiveCompare(rhs) == .orderedSame else {
        return false
    }
    guard let lv = aa[lhs], let rv = bb[rhs],
          lv.caseInsensitiveCompare(rv) == .orderedSame else {
        return false
    }
    return true
}

// Finding elements
wordList = ["A": "Apple", "B": "Banana", "C" : "City"]

// 임의의 조건을 클로저로 만들어서 상수에 저장하기
let cond: ((String, String)) -> Bool = {
    $0.0 == "B" || $0.1.contains("i")
}

wordList.contains(where: cond)

let r = words.first(where: cond)    // 값이 계속 바뀜
r?.key
r?.value

// 조건에 맞는 것만 모아서 따로 리턴
wordList.filter(cond)
wordList

