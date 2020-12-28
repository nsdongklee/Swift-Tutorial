import UIKit

// Case Intensive Option
"A" == "a"

"A".caseInsensitiveCompare("a") == .orderedSame

"A".compare("a", options: [.caseInsensitive]) == .orderedSame

// Literal Option
let a = "\u{D55C}"  // "한"
let b = "\u{1112}\u{1161}\u{11AB}"  //조합형: "ㅎㅏㄴ"

// 조합된 문자가 같다면 'true'
a == b
a.compare(b) == .orderedSame
// 있는 그대로(코드 유닛 단위)를 비교하고 싶을 때: Literal
a.compare(b, options: [.literal]) == .orderedSame

// 문자열 검색 방향 지정: Backwards Option('->' == leading, '<-' == Trailing)
let kor = "행복하세요"
let eng = "Be Happy"

if let range = eng.range(of: "p") {
    eng.distance(from: eng.startIndex, to: range.lowerBound)
}

if let range = eng.range(of: "p", options: [.backwards]) {
    eng.distance(from: eng.startIndex, to: range.lowerBound)
}

// Anchored Option
let str = "Swift Programming"

if let result = str.range(of: "Swift") {
    print(str.distance(from: str.startIndex, to: result.lowerBound))
} else {
    print("Not found")
}

if let result = str.range(of: "Swift", options: [.anchored]) {
    print(str.distance(from: str.startIndex, to: result.lowerBound))
} else {
    print("Not found")
}

if let result = str.range(of: "Swift", options: [.anchored, .backwards]) {
    print(str.distance(from: str.startIndex, to: result.lowerBound))
} else {
    print("Not found")
}

str.lowercased().hasPrefix("swift")

