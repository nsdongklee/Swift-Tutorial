import UIKit

struct Size {
    var width = 0.0
    var height = 0.0
}

extension Size {
    // 계산 속성 추가
    var area: Double {
        return width * height
    }
}

// 속성에 접근
let s = Size()
s.width
s.area

// 사이즈 구조체가 Equatable 프로토콜을 갖는 것을 선언
extension Size: Equatable {
    public static func == (lhs: Size, rhs: Size) -> Bool {
        return lhs.width == rhs.width && lhs.height == rhs.height
    }
}

// Adding Properties
extension Date {
    var year: Int {
        let cal = Calendar.current
        return cal.component(.year, from: self)
    }
}
let today = Date()
today.year

extension Double {
    var radianValue: Double {
        return (Double.pi * self) / 180.0
    }
    var degreeValue: Double {
        return self * 180.0 / Double.pi
    }
}
let dv = 45.0
dv.radianValue.degreeValue
dv.degreeValue

// Sample Subject: extension 구현
extension Date {
    var month: Int {
        let cal = Calendar.current
        return cal.component(.month, from: self)
    }
    var day: Int {
        let cal = Calendar.current
        return cal.component(.day, from: self)
    }
    var yesterday: Date {
        let cal = Calendar.current
        return cal.date(byAdding: .day, value: -1, to: self)!
    }
}

func solution(_ year:Int, _ month:Int, _ day:Int) -> [Int] {
    let calendar = Calendar.current
    var comps = DateComponents()
    comps.year = year
    comps.month = month
    comps.day = day

    let date = calendar.date(from: comps)!

    let m = date.yesterday.month
    let d = date.yesterday.day

    return [m, d]
}

//let cal = Calendar.current
//var comps = DateComponents()
//comps.year = 2021
//comps.month = 1
//comps.day = 3
//let date = cal.date(from: comps)!
//print(date)
//date.yesterday.month
//date.month
