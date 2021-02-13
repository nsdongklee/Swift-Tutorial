//: [Previous](@previous)

import Foundation

enum EncodingError: Error {
   case unknown
   case invalidRange
}

struct Employee: Codable {
   var name: String
   var age: Int
   var address: String?
   
   //
    func encode(to encoder: Encoder) throws {
        // 코딩키 열거형 안에 있는 키와 속성 리턴
        var container = encoder.container(keyedBy: CodingKeys.self)
        // 첫 파라미터와 두번째 파라미터를 맵핑
        try container.encode(name, forKey: .name)
        
        guard (30 ... 60).contains(age) else {
            throw EncodingError.invalidRange
        }
        
        try container.encode(age, forKey: .age)
        // 옵셔널 데이터 인코딩
        try container.encodeIfPresent(address, forKey: .address)
    }
   //
}

let p = Employee(name: "James", age: 20, address: "Seoul")


let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

do {
   let jsonData = try encoder.encode(p)
   if let jsonStr = String(data: jsonData, encoding: .utf8) {
      print(jsonStr)
   }
} catch {
   print(error)
}






//: [Next](@next)

