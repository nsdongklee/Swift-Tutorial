import UIKit

// Basics
let set: Set<Int> = [1,2,2,2,3,3,3,3,4]
set

// Inspecting Set
set.count
set.isEmpty

// Testing for membership
set.contains(1)

// Adding and Removing Elements
var words = Set<String>()
var insertResult = words.insert("Swift")
insertResult.memberAfterInsert
words

insertResult = words.insert("Swift")    // 중복 값을 허용하지 않기 떄문에 false 리턴
insertResult.memberAfterInsert
words

var updateResult = words.update(with: "Swift")
updateResult

updateResult = words.update(with: "Apple")
updateResult
words

// Hash value
var val = "Hello"
val.hashValue

updateResult = words.update(with: val)
updateResult
words

// Comparing Set
var a: Set = [1, 2, 3, 4, 5, 6, 7, 8, 9]
var b: Set = [1, 3, 5, 7, 9]
var c: Set = [2, 4, 6, 8, 10]
let d: Set = [1, 7, 5, 9 ,3]

a == b
a != b

b == d      // 정렬되지 않았지만 같다고 판단
b.elementsEqual(d)  // 결과가 와리가리함

a.isSubset(of: a)   // 자신의 부분집합
a.isStrictSubset(of: a)

b.isSubset(of: a)
b.isStrictSubset(of: a)

// 교집합
a.isDisjoint(with: b)
a.isDisjoint(with: c)
b.isDisjoint(with: c)   // 서로소 집합은 true

// 합집합
var result = b.union(c)

b.formUnion(c)  // 원본을 바로 변경
b
b = [1, 3, 5, 7, 9]

// 교집합
result = a.intersection(b)
result = c.intersection(b)

// 여집합
result = a.symmetricDifference(b)

// 차집합
result = a.subtracting(b)
a.subtract(b)
