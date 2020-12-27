import Cocoa

let s = "String"

// char 타입으로 변경하고 싶으면 무조건 타입지정해야함
//let c = "C"
let c: Character = "C"

// 빈 문자열: 공백을 넣어줘야한다.
let emptyChar: Character = " "

let emptyStr = ""
emptyStr.count

// 생성자로 문자열 생성
let emptyStr2 = String()

// String Type: 두 자료형은 호환되는 형식이지만 유니코드를 다루는 방식이 다르다.
var nsstr: NSString = "str"

let swiftStr: String = nsstr as String  // Type Casting

// Unicode
let str = "Swift String"

str.utf8
str.utf16

// 따봉 이모티콘
// 유니코드: U+1F44D, UTF-8: F0 9F 91 8D
var thumbUp = "\u{1F44D}"

// Multiline String Literals
let dummyStr = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit,
    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem
ipsum dolor sit. Volutpat odio facilisis mauris sit amet massa.
"""
print(dummyStr)

// String Interpolation: 문자열 삽입(보간)
var strInter = "12.34KB"

// 일반적으로 Type Casting 및 '+' 연산자로 가능하다.
let size = 12.34
strInter = String(size) + "KB"
print(strInter)

strInter = "\(size)KB"          // 문자열 보간법

// Format Specifier: %char
strInter = String(format: "%.1fKB", size)

String(format: "Hello, %@", "Swift")
String(format: "%d", 12)
String(format: "%010.3f", 12.34)
String(format: "%-10.3f", 12.34)

// 파라미터 전달 순서 바꾸기
let firstName = "Yoon-ah"
let lastName = "Lim"
let korIntro = "그녀의 이름은 %2$@ %1$@ 입니다."
let engIntro = "Her name is %@ %@."

String(format: korIntro, firstName, lastName)
String(format: engIntro, firstName, lastName)

// String Indices
let lang = "Swift"
let firstChar = lang[lang.startIndex]
let secCharIdx = lang.index(after: lang.startIndex)
// let lastChar = lang[lang.endIndex]
let lastCharIdx = lang.index(before: lang.endIndex)
let lastChar = lang[lastCharIdx]
print(firstChar)
print(lastChar)

// String Subscript
let dummStr = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

// range(of:)를 활용해서 시작 인덱스를 구해주세요.
let startIndex = dummStr.range(of: "nisi")
dummStr[startIndex!]

// index(_:offsetBy:)를 활용해서 종료 인덱스를 구해주세요.
let endIndex = dummStr.index(startIndex, offsetBy: 14)

// 서브스크립트 문법으로 범위를 추출해 주세요.
let result = str[startIndex ..< endIndex]
print(result == "nisi ut aliquip")
