import Cocoa

let data = ("<html>", 200, "OK", 12.34)
type(of: data)

// 인덱스로 데이터 호출
data.0
data.1
data.2
data.3

var mutableTuple = data
mutableTuple.1 = 404
print(mutableTuple.1)

// Named Tuple
let named = (body: "<html>", statusCode: 200, statusMessage: "OK", dataSize: 12.34)

named.1
named.statusCode

// tuple Decomposition(분해): 튜플로 된 자료형을 개별 상수, 변수에 저장하는 방식

let data2 = ("<html>", 200, "OK", 12.34)
let (body, code, message, _) = data2

// Tuple matching

let resolution = (3840.0, 1080.0)

if resolution.0 == 3840 && resolution.1 == 2160 {
    print("4K")
}

switch resolution {
case let (w, h) where w / h == 16.0 / 9.0:
    print("16:9")
case (_, 1080):
    print("1080p")
case (3840 ... 4096, 2160):
    print("4K")
default:
    break
}


