import UIKit

// forEach 랑 for-in 반복문 사용해보기
let nums: [Int] = [1, 2, 3, 4, 5]

for n in nums {
    print(n)
}

// n 자리에는 위 for-in 에서 n과 같음
nums.forEach { n in
    print(n)
}


// 반복문 돌면서 인덱스도 쓰고 알고 쓰고 싶을 때
for (idx, n) in nums.enumerated() {
    print(idx, n)
}

// 클로저 문법으로 변경
nums.enumerated().forEach {
    print("here: ", $0, $1)
}

//인덱스 생성해서 조회해보기
for i in stride(from: 0, to: 2, by: 1) {
    print("for i:", i)
}

stride(from: 0, to: 2, by: 1).forEach {
    print("forEach:", $0)
}


//제너릭 타입 다시 연습
struct Color<T> {       // <T> 라는 플레이스홀더를 지정한다.
    var red: T
    var green: T
    var blue: T
}

var c = Color(red: 128, green: 80, blue: 200)
var d = Color(red: 128.0, green: 80.0, blue: 200.0)
c.blue  //200
d.blue  //200.0

//익스텐션으로 위에 Color 제너릭 구조체 확장해보기
extension Color {
    func getComponents() -> [T] {       // 제너릭 타입 리스트로 받겠다는 말
        return [red, green, blue]
    }
}

let intColor = Color(red: 1, green: 2, blue: 3)
intColor.getComponents()

let dbColor = Color(red: 1.0, green: 2.0, blue: 3.0)
dbColor.getComponents()


