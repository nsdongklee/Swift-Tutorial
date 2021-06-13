import Cocoa

// String Basics
var str = "Hello, Swift String"

// 빈 문자열
var emptyStr = ""
emptyStr = String()

// 문자열로 타입 변환
let a = String(true)
let b = String(12)
let c = String(12.34)

// 진법 변환된 문자열로 출력하기
let hex = String(123, radix: 16)
let oct = String(123, radix: 8)
let bin = String(123, radix: 2)

// cmd + ctrl + space 🤙

// 반복 적용
let repeatStr = String(repeating: "🤙", count: 7)

// String Interpolation
let e = "\(a) \(b)"
let f = a + " " + b
str += "!!"

str.count
str.isEmpty

str.lowercased()
str.uppercased()
str

// upperCamelCase 로 바꾸어 주는 키워드
"apple and Ipad".capitalized

// 반복문에서 문자열 하나씩 뽑기
for c in "Example" {
    print(c)
}

// substring
let str2 = "Hello Swift"
var first = str2.prefix(3)

// 새로운 메모리 공간에 저장하고 싶을 때
let newStr = String(str2.prefix(3))

// 범위 연산자로 substring
let s = str2[str2.startIndex ..< str2.index(str2.startIndex, offsetBy: 2)]

// String editing
var appendStr = "Hello"
appendStr.append(" Swift")
appendStr

let temp = appendStr.appending(" ADD")
temp

"File size is... ".appendingFormat("%.1f", 12.3456)

//Replacing Substrings
var dumStr = "Hello Objective-C"
if let range = dumStr.range(of: "Objective-C") {
    dumStr.replaceSubrange(range, with: "Swift")
}
dumStr

if let range = dumStr.range(of: "Hello") {
    let ss = dumStr.replacingCharacters(in: range, with: "Hi")
    ss
    dumStr
}

// Remove Substring
var dummStr = "Hello awesome Swift!"
let lastCharIdx = dummStr.index(before: dummStr.endIndex)
var removed = dummStr.remove(at: lastCharIdx)

removed
dummStr

// Remove Substring(range)
if let range = dummStr.range(of: "awesome") {
    dummStr.removeSubrange(range)
}
dummStr

dummStr = "Hello awesome Swift!!!"
// var subStr = dummStr.dropLast(3)

dummStr.count

let str3 = "Lorem ipsum dolor sit amet"
var temp2 = str3.replacingOccurrences(of: "i", with: "")
let result = temp2.replacingOccurrences(of: "o", with: "O")
print(result == "LOrem psum dOlOr st amet")

// String Comparison
let largeA = "Apple"
let smallA = "apple"
let bbb = "Banana"

largeA != smallA
largeA < smallA
largeA < bbb

// String Comparison With method
largeA.compare(smallA) == .orderedSame
largeA.caseInsensitiveCompare(smallA) == .orderedSame
largeA.compare(smallA, options: [.caseInsensitive]) == .orderedSame

let compStr = "Hello, Swift Programming"
let prefix = "Hello"
let suffix = "programming"

compStr.hasPrefix(prefix)
compStr.hasSuffix(suffix)

// String Searching
let findStr = "Hello Swift"
findStr.contains("swift")
findStr.lowercased().contains("swift")
findStr.range(of: "Swift")
findStr.range(of: "Swift", options: [.caseInsensitive]) // 대소문자 무시

let str4 = "Hello, Programming"
let str5 = str4.lowercased()
var common = str5.commonPrefix(with: str4)
common = str5.commonPrefix(with: str4, options: [.caseInsensitive])
