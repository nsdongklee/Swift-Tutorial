import UIKit

struct Person: Codable {
   var firstName: String
   var lastName: String
   var birthDate: Date
   var address: String?
}

let p = Person(firstName: "John", lastName: "Doe", birthDate: Date(timeIntervalSince1970: 1234567), address: "Seoul")

// 일반 데이터를 JSON 데이터로 인코딩
let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted   // 줄바꿈, 공백 추가

do {
    let jsonData = try encoder.encode(p)    // json 문자열은 바이너리 데이터로
    // 실제 결과 확인을 위한 문자열 치환
    if let jsonStr = String(data: jsonData, encoding: .utf8) {
        print(jsonStr)
    }
} catch {
    print(error)
}

//
encoder.keyEncodingStrategy = .convertToSnakeCase


//: [Next](@next)
