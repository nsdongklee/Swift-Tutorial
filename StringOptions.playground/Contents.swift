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


// Numeric Option
"A" < "B"
"a" < "B"

let file9 = "file9.txt"
let file10 = "file10.txt"
file9 < file10

file9.compare(file10) == .orderedAscending
file9.compare(file10, options: [.numeric]) == .orderedAscending

// Diacritic Insensitive(발음기호 처리)
let aa = "Cafe"
let ab = "Cafè"

aa == ab
aa.compare(ab, options: [.diacriticInsensitive]) == .orderedSame

// Width Insensitive Option
let japanA = "\u{30A1}"
let japanAA = "\u{ff67}"

japanA == japanAA
japanA.compare(japanAA, options: [.widthInsensitive]) == .orderedSame

// Forced Ordering Option(강제 정렬)
let upper = "STRING"
let lower = "string"

upper == lower
upper.compare(lower, options: [.caseInsensitive]) == .orderedSame   // 대소문자 무시
upper.compare(lower, options: [.caseInsensitive, .forcedOrdering]) == .orderedSame

// Regular Expression(정규표현식)
let emailPattern = "([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\\.[0-9a-zA-Z_-]+){1,2}"
let emailAddr = "user@example.com"

if let _ = emailAddr.range(of: emailPattern) {
    print("found pattern")
} else {
    print("not found")
}
// add option
if let _ = emailAddr.range(of: emailPattern, options: [.regularExpression]) {
    print("found pattern")
} else {
    print("not found")
}

// add index
if let range = emailAddr.range(of: emailPattern, options: [.regularExpression]), (range.lowerBound, range.upperBound) == (emailAddr.startIndex, emailAddr.endIndex) {
    print("found pattern")
} else {
    print("not found")
}

// Character Set(문자집합)

