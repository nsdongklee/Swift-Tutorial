import UIKit

// Any, AnyObject: 범용 자료형
var data: Any
data = 2.3
data = "str"
data = [1, 2, 3]
data = NSString()   // 참조형식 저장도 가능하다.

// 메소드를 사용하기 위해서는 타입 캐스팅이 필요하다.
if let str = data as? String {
    print(str.count)
}   else if let list = data as? [Int] {
    // statement
}

let list: [Any] = [1, "2", 3.5, "Hello", -123]

var intList = [Int]()
var doubleList = [Double]()
var strList = [String]()

// 여기에서 구현해 주세요.
for item in list {
    print(type(of: item))
//    if type(of: item) is Int {
//        intList.append(item as! Int)
//    } else if type(of: item) is Double {
//        doubleList.append(item as! Double)
//    } else {
//        strList.append(item as! String)
//    }
}
print("========================")
for item in list {
    if let data = item as? Int {
        intList.append(item as! Int)
    } else if let data = item as? Double {
        doubleList.append(item as! Double)
    } else {
        strList.append(item as! String)
    }
}
print(intList, doubleList, strList)
