import UIKit

// 날짜를 문자열로 포맷팅
extension Date {
    func toString(format: String = "yyyyMMdd") -> String {
        let privateFormatter = DateFormatter()
        privateFormatter.dateFormat = format
        return privateFormatter.string(from: self)
    }
}

let today = Date()
today.toString()
today.toString(format: "yyyy/mm/dd")

// 랜덤 문자열 생성 메소드
extension String {
    static func random(length: Int, charactersIn chars: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") -> String {
        var randomString = String()
        randomString.reserveCapacity(length)
        
        for _ in 0 ..< length {
            guard let char = chars.randomElement() else {
                continue
            }
            randomString.append(char)
        }
        return randomString
    }
}
String.random(length: 5)

var temp = "   asd   "
temp.trimmingCharacters(in: [" "])
temp


extension String {
    func trimmed() -> String {
        return self.trimmingCharacters(in: [" "])
    }
}
temp.trimmed()

 
