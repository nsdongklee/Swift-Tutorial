import UIKit

// Stored Properties
class Person {
    let name: String = "Lee"
    var age: Int = 33
}

// Explicit Member Expression
let p = Person()
p.name
p.age

p.age = 30
p.age


struct Person2 {
    let name: String = "Lee"
    var age: Int = 33
}

// 구조체로 바꾸어서 활용하면 멤버 변수가 var 이여도 바꿀 수 없다.
let p2 = Person2()
p2.name
p2.age

//p2.age = 30
p2.age

// Lazy Stored Properties
struct Image {
    init() {
        print("new image")
    }
}

struct BlogPost {
    let title: String = "Title"
    let content: String = "Content"
    lazy var attachment: Image = Image()
    
    let date: Date = Date()
    
    lazy var formattedDate: String = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .medium
        return f.string(from: date)
    }()     // 괄호를 붙이면 앞의 클로저가 초기화 시점에 호출된다.
}

var post = BlogPost()
post.attachment
post.date
