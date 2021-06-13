import UIKit


// 기본 초기화
struct PositionValue {
    var x = 0.0
    var y = 0.0
}

class PositionObject {
    var x = 0.0
    var y = 0.0
}

var v = PositionValue()
var o = PositionObject()
v.x
o.x

var v2 = v
var o2 = o

v2.x = 12
v2.y = 34

// v2 를 바꾸어도 v의 값은 바뀌지 않는다.
v.x
v.y
v2.x
v2.y

// 클래스의 값을 바꾸어 보기
o2.x = 12
o2.y = 34

// 원본 자체를 바꾸기 때문에 전체가 바뀐다.
o.x
o.y
o2.x
o2.y
