import UIKit

// 파라미터가 없고 리턴타입이 없는 단순한 클로저
let c = { print("Hello Swift") }

// 클로저 호출
c()

// 클로저에 파라미터와 리턴타입 추가
let c2 = { (str: String) -> String in
    return "Hello \(str)"
}

let res = c2("Closure")
print(res)

typealias SimpleStringClosure = (String) -> String

func perform(closures: SimpleStringClosure) {
    print(closures("iOS"))
}
perform(closures: c2)
perform(closures: { (str: String) -> String in
    return "Hi, \(str)"
})


// Ex.
let products = [
   "MacBook Air", "MacBook Pro",
   "iMac", "iMac Pro", "Mac Pro", "Mac mini",
   "iPad Pro", "iPad", "iPad mini",
   "iPhone Xs", "iPhone Xr", "iPhone 8", "iPhone 7",
   "AirPods",
   "Apple Watch Series 4", "Apple Watch Nike+"
]

var proModels = products.filter({ (name: String) -> Bool in
    return name.contains("Pro")
})

// 1. 클로저 형식에서 파라미터 자료형과 리턴타입을 생략할 수 있다.
products.filter({ (name) in
    return name.contains("Pro")
})

// 2. 파라미터의 이름을 Shorthand Argument Name 으로 대체할 수 있다.(파라미터 이름과 'in' 키워드 생략)
products.filter({
    return $0.contains("Pro")
})

// 3. Implicit returns : 리턴 키워드 생략
products.filter({
    $0.contains("Pro")
})

// 4. 클로저 파라미터가 마지막 파라미터라면 Trailing Closure 로 작성한다.
products.filter() {
    $0.contains("Pro")
}

// 4. Trailing Closure 및 괄호 생략
products.filter {
    $0.contains("Pro")
}

proModels.sort(by: { (lhs: String, rhs: String) -> Bool in
    return lhs.caseInsensitiveCompare(rhs) == .orderedAscending
})
print(proModels)

// Closure Syntax Optimization 적용
proModels.sort {
    $0.caseInsensitiveCompare($1) == .orderedAscending
}
print(proModels)

