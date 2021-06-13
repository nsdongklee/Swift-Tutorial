import UIKit

// Equitable 프로토콜을 사용하여 비교연산자 적용할 수 있도록 하기
struct Color: Equatable {
   let red: Int
   let green: Int
   let blue: Int

   static var black: Color {
      return Color(red: 0, green: 0, blue: 0)
   }

   static var white: Color {
      return Color(red: 255, green: 255, blue: 255)
   }
}

// 아래에 있는 코드는 수정하지 마세요.
let b = Color.black
let w = Color.white

print(b == w)
print(1)
