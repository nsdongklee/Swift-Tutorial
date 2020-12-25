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
