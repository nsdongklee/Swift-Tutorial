//
//  Mastering iOS
//  Copyright (c) KxCoding <help@kxcoding.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

/*:
 # DateFormatter
 */

import UIKit

let now = Date()
print(now)

// 새로운 날짜포맷 인스턴스 생성
let formatter = DateFormatter()

formatter.dateStyle = .full
formatter.timeStyle = .medium

formatter.locale = Locale(identifier: "ko_KR")

var result = formatter.string(from: now)
print(result)

// 파리미터로 사용하는 날짜가 옵셔널이라면
formatter.string(for: now)

// 반복적인게 아니라면 클래스의 메소드를 사용할 수 있음
DateFormatter.localizedString(from: now, dateStyle: .long, timeStyle: .short)

//: [Next](@next)
