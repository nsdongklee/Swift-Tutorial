import UIKit

// 서브스크립트 직접구현하기
class List {
    var data = [1,2,3,4]
    subscript(index: Int) -> Int {
        get {
            return data[index]
        }
        set {
            data[index] = newValue
        }
    }
}

var l = List()
l[0]
l[1] = 123

struct Matrix {
    var data = [[1, 2, 3],
                [4,5,6],
                [7,8,9]]
    // 읽기 전요으로 서브스크립트 구조체에서 구현
    subscript(row: Int, col:Int) -> Int {
        return data[row][col]
    }
}
let m = Matrix()
m[0, 0] // [row][col] 방식으로 전달하지 않는다. 왜냐하면 파라미터로 전달하는 것이기 때문.


// Sample Subject
struct Player {
   let number: Int
   let name: String
}

struct Team {
   let name: String
   let squad: [Player]
    
   // 여기에서 서브스크립트를 구현해 주세요.
//    subscript(index: Int) -> String{
//        return self.squad[].name
//    }
}

// 아래에 있는 코드는 수정하지 마세요.
let firstTeam = [
   Player(number: 1, name: "Hugo Lloris"),
   Player(number: 3, name: "Danny Rose"),
   Player(number: 4, name: "Toby Alderweireld"),
   Player(number: 5, name: "Jan Vertonghen"),
   Player(number: 7, name: "Heung-Min Son"),
   Player(number: 10, name: "Harry Kane"),
   Player(number: 12, name: "Victor Wanyama"),
   Player(number: 20, name: "Dele Alli"),
   Player(number: 23, name: "Christian Eriksen"),
   Player(number: 33, name: "Ben Davies")
]
let tot = Team(name: "Tottenham Hotspur", squad: firstTeam)
//tot.squad[]

//var name: String?
//var number: Int?
//
//if let player = tot[7] {
//   name = player.name
//}
//
//if let player = tot["David de Gea"] {
//   number = player.number
//}
//
////print(name == .some("Heung-Min Son") && number == nil)
