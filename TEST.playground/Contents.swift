import UIKit

// 변수, var, let, type
let month: Int = 10
var temperature: Double = 17.3
let nationalHoliday: String = "dayDay"

// 타입지정 하거나 초기값 지정 필요
var temp: String
temp = "test any value"

// Type Safety, Type Conversion vs Casting
let rate: Double = 1.34
let value = 10_1000_100
let resRV = rate * Double(value) //타입캐스팅 하던지 같은 값만 연산됨

// 오버플로우 연산자: ~~
let a: Int8 = Int8.max
let b: Int8 = a &+ 1

// 비교연산자: == != < <= > >=
// 논리연산자: ! && ||

3...5
(1...10).reversed()

let range = ...5    //lowerbound 는 무한대가 된다.
range.contains(7)
range.contains(1)

// 스위치, fallthrough
switch value {
case ...1000:
    print("small")
case 1000...(value+1):
    print("yes")
//    fallthrough
default:
    print("dont know case")
}

// 가드: 원하는 조건이 아니면 빨리 끝내기 위한 조건문, 함수 안에 작성해야한다.
//guard value < 10 else {
//    return
//}

print("NO EXIT")

//for반복문
for idx in 1...10 {
    print(idx)
}
for idx in stride(from: 0, to: 3, by: 1) {
    print(idx)
}

//while
var whileIdx = 0
while whileIdx < 3 {
    print(whileIdx)
    whileIdx += 1
}

// Labled statement 문장에 이름을 붙일 수 있다.
outer: for i in 1 ... 3 {
    print("outer loop", i)
    for j in 1 ... 3 {
        print(" inner loop", j)
        break outer
    }
}

//옵셔널
var num: Int? = nil
print(num)
num = 123
print(num)
print(num!)

if num != nil {
    print(num!)
}

//옵셔널바인딩: 바로 강제추출하기보다는 값이 있을때 추출하는게 좋음
var myName: String? = nil
//myName = "dongklee"
if let name = myName {
    print(name)
}

//개행문자 테스트함
let testEs: String? = ""
if let tt = testEs {
    print(tt)
}

//함수정의 기본, 파라미터 변수는 임시적으로 상수가 된다. 기본값 지정도 가능
func newAdd(a: Int = 2, b: Int) -> Int {
    return a + b
}

//클로저: 일반적으로 클로저는 언네임드클로저, 일반함수는 네임드클로저
// 일반적으로 in으로 헤드-바디 구분. 파라미터나 리턴타입 없는 단순한 클로저도 가능하다
let c = { print("thisisclosure")}
c() // 클로저호출

let c2 = { (tempStr: String) -> String in
    return "hello \(tempStr)"
}
let resC2 = c2("closure")
print(resC2)

typealias SimpleStringClosure = (String) -> String

func perform(closures: SimpleStringClosure) {
    print(closures("iOS"))
}
perform(closures: c2)

//클로저 실험해보기.
let products = [
   "MacBook Air", "MacBook Pro",
   "iMac", "iMac Pro", "Mac Pro", "Mac mini",
   "iPad Pro", "iPad", "iPad mini",
   "iPhone Xs", "iPhone Xr", "iPhone 8", "iPhone 7",
   "AirPods",
   "Apple Watch Series 4", "Apple Watch Nike+"
]
//for p in products {
//    print(p)
//}
var proModels = products.filter({ (name: String) -> Bool in
    return name.contains("Pro")
})

products.filter({ (name) in
    return name.contains("Pro")
})

products.filter({
    return $0.contains("Pro")
})

// 클로저가 마지막 파라미터라면 Trailing 클로저로 작성
products.filter() {
    $0.contains("Pro")
}
// 트레일링 클로저 일때 () 생략 가능
products.filter {
    $0.contains("Pro")
}

proModels.sort(by: { (lhs: String, rhs: String) -> Bool in
    return lhs.caseInsensitiveCompare(rhs) == .orderedAscending
})

proModels.sort {
    $0.caseInsensitiveCompare($1) == .orderedAscending
}
//주의! 클로저 내부에서는 원본 그대로 참조
var numC3 = 0
let c3 = {
    numC3 += 1            // 연산 적용되는지 확인
  print("check point #1: \(numC3)")
}
c3()
c3()

//튜플
let newTuple = ("first", 200, 12.34)
print(type(of: newTuple))
//튜플 분해
let (body, code, _) = newTuple

//문자열 인덱싱
let lang: String = "Swift"
let fstChar = lang[lang.startIndex]
let secInd = lang.index(after: lang.startIndex)
lang[lang.startIndex]

//서브스트링
let startStr = "hello_swift"
startStr.prefix(3)
//문자열 길이
print(startStr.count)
//문자열 범위로 서브스트링
let strRange = startStr.index(startStr.startIndex, offsetBy: 2)..<startStr.index(startStr.startIndex, offsetBy: 5)
print(startStr[strRange])
//문자열 스플릿
let splitStr = "good,cadet,cluster"
let splitArr = splitStr.split(separator: ",")

splitArr.map { str in
    return print(str)
}

//마지막 인덱스
startStr[startStr.index(before: startStr.endIndex)]

for i in startStr {
    print(i)
}

//인덱스 방식으로 문자열 조회해보기
//문자열.index(문자열.startIndex, offsetBy: n)
for idx in stride(from: 0, to: startStr.count, by: 1) {
    print("Now \(idx)... ", startStr[startStr.index(startStr.startIndex, offsetBy: idx)])
}
// 문자열 비교
let largeA = "APPLE"
let smallA = "apple"
//if문 안쓰고 메소드써서 객체화 후, 비교연산
largeA.compare(smallA) == .orderedSame //그냥 비교하면 오류
largeA.caseInsensitiveCompare(smallA) == .orderedSame
largeA.compare(smallA, options: [.caseInsensitive]) == .orderedSame //코드 유지보수에 좀더 좋을것 같다. 옵션만 잘 기억하면 항상 compare 쓴 상태에서 옵션만 바꾸면 되니. 또한 옵션 나열도 가능

//컬렉션: Array, Dictionary, Set >>> 타입지정필요 왜냐면 기본적으로 제너릭 타입이라

//1. Array
var basicArr: Array<String>
basicArr = ["a", "b", "c"]
var shortArr: [String]
shortArr = ["c", "b", "a"]
shortArr[0] //배열 조회
basicArr[1 ... 2]

let fruits = ["Apple", "Banana", "Melon"]
fruits[fruits.startIndex]
fruits[fruits.index(before: fruits.endIndex)]

// Adding Elements
var alphabet = ["A", "B", "C"]
alphabet.append("E")    // 같은 자료형만 추가할 수 있음
alphabet.append(contentsOf: ["F", "G"]) //여러 요소를 추가하고 싶을 때 옵션을 준다.
alphabet.insert("D", at: 3)
alphabet.insert(contentsOf: ["a", "b", "c"], at: 0)
alphabet[0 ..< 3] = []  // 빈 배열로 바꾸면 삭제 효과를 볼 수 있다.
alphabet


//2. Dictionary
var basicDict: Dictionary<String, Int>
basicDict = ["A": 3, "B": 2]
var shortDict: [String: Int]
shortDict = ["A": 2, "B": 3]

//3. Set
var basicSet: Set<Int>

//Structure
//구조체 내부에서 데이터를 수정할 때 mutating 키워드 사용
struct Area {
    var x: Int
    var y: Int
    var width: Int
    var height: Int
    mutating func extend(by: Int) -> Area {
        return Area(x: x, y: y, width: self.width * by, height: self.height * by)
    }
    mutating func reset() {
        self.x = 0
        self.y = 0
        self.width = 0
        self.height = 0
    }
}

var basicArea = Area(x: 0, y: 0, width: 100, height: 100)
var wideArea = basicArea.extend(by: 3)
wideArea.width
basicArea.reset()

//클래스와 구조체 기본적인 느낌 잡기
class Person {
    let name: String = "dongklee"
    var age: Int = 29
}

let pClass = Person()
pClass.name
pClass.age = 30
pClass.age

struct Person2 {
    let name: String = "dongklee"
    var age: Int = 29
}
let structP = Person2()
structP.name
structP.age
//structP.age = 30

struct Image {
    init() {
        print("new image")
    }
}
struct BlogPost {
    let title: String = "this is title"
    let content: String = "Content"
    lazy var attachment: Image = Image()
}
var post = BlogPost()
post.attachment

Calendar.current.component(.year, from: Date())
print(Date())
