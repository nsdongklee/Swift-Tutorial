# Summaries Basics of Swift

### 기초 용어 일부



### 자료형 직접 선언하기

```swift
// 자료형 직접 선언
let month: Int = 10
let day: Int = 9
let nationalHoliday: String = "Han-gle day"
let temperature: Double = 17.3
let weather: String = "warm"
```

> `:` 기호와 함께 쓰고자 하는 자료형을 직접 선언할 수 있다.



### Type Inference 형식 추론

```swift
let num = 123
type(of: num)		// Int.Type

let temp = 11.2
type(of: temp)		// Double.Type

let str = "Swift"
type(of: str)		// String.Type

let a = true
let b = false
type(of: a)
type(of: b)			// Boolean.Type
```

> 자료형을 생략할 때 추론의 단서가 무엇인지 확인 하는 방법

- 초기값을 저장할 수 없는 상황이라면 형식 추론 불가 (자료형을 직접 명시해야 함)

### Type Annotation

직접 자료형을 명시하는 상황

```swift
let value: Double
value = 12.3
```

> 초기값을 명시하지 않아 형식 추론이 불가한 대신, 직접 자료형을 명시하고 추 후에 값을 지정

### Type Safety

자료형의 타입을 지정하려고 할 때, 이에 맞지 않는 자료형의 값을 입력하거나 바꾸려고 할 때 이러한 오류를 막아주어 안정성을 보장한다.

- 서로 호환되지 않는 값을 연산하려고 할 때도 오류가 발생한다.

  ```swift
  // ex.
  let rate = 1.94
  let amt = 10_000_000
  let result = rate * amt		// Error
  ```

- 개별 값을 *Type Conversion* 을 통해 원하는 자료형으로 변경하여 연산할 수 있다.

### Type Conversion

> 형변환과 관련된 두 용어 주의!
>
> ***Type Conversion*** : 메모리에 저장된 값을 다른 형식으로 바꾸어서 새로운 값을 생성
>
> ***Type Casting*** : 메모리에 저장된 값을 그대로 두고 컴파일러가 다른 형식으로 처리하도록 지시

- Type Conversion

  ```swift
  // ex.1
  
  let a = 123
  let b = 4.56
  Double(a) + b
  
  // ex.2
  let c = Int.max
  let d = Int8(c)		// Error : 큰 자료형에서 작은 자료형으로 변환하려고 했기 때문
  
  // ex.3
  let str = "123"
  let num = Int(str)
  
  let str = "number"
  let num = Int(str)		// nil
  ```

### Type Alias

```swift
typealias NewName = TypeName
```

> 기본형

```swift
typealias Coordinate = Double

let a: Coordinate = 12.34
let b: Double = 56.78
```

> 타입의 별칭을 만들어 활용할 수 있다.

## Operators

- 기본 : 연산자(Operator), 피연산자(Operand)

- 단항연산자 *Unary Operator*

  ```swift
  +a // prefix operator(피연산자 앞)
  a+ // postfix operator(피연산자 뒤)
  ```

  > 띄어쓰기 금지

- 이항연산자 *Binary Operator*

  ```swift
  a + b
  ```

- 삼항연산자 *Ternary Operator*

  ```swift
  a ? b : c
  ```

- 연산자 우선순위

- 연산자 결합규칙

  - 좌 결합성(Left Associative, 좌에서 우로 결합하며 연산)
  - 우 결합성(Right Associative, 우에서 좌로 결합하며 연산)

### 산술 연산자 Arithmetic Operators

- 종류 :

  `+`, `-`, `*`, `/`, `%`

- 오버플로우 관련

  ```swift
  let num: Int8 = 9 * 9 * 9		//오버플로우 발생하는 숫자는 컴파일 불가하며, 오버플로우 연산자를 사용해야한다.
  ```


### 오버플로우 연산자 Overflow Operators

일반적으로 스위프트 언어에서는 연산의 결과가 오버플로우 현상을 일으킬 때는 에러를 출력하여 컴파일 할 수 없지만 오버플로우 연산자를 통해서 연산 자체를 허용하지만 값은 일반적인 오버플로우 결과와 같게 할 수 있다.

- 오버플로우 연산자의 종류와 사용

  ```swift
  // Overflow Addition Operator(&+)
  let a: Int8 = Int8.max
  let b: Int8 = a &+ 1
  
  // Overflow Subtraction Operator(&-)
  let c: Int8 = Int8.min
  let d: Int8 = a &- 1
  
  // Overflow Multiplication Operator(&*)
  let e: Int8 = Int8.max &* 2
  ```

### 비교 연산자 Comparison Operators

두 개 이상의 무언가를 서로 비교할 때 사용하는 연산자(이항 연산자). 결과는 항상 *Boolean* 타입이다.

- 비교 연산자의 종류
  - `==`, `!=`, `<`, `<=`, `>`, `>=`

### 논리 연산자 Logical Operators

참과 거짓을 구분하는 데 사용하는 연산자. 피연산자 및 결과 또한 *Boolean* 타입

- 논리 연산자의 종류
  - `!`, `&&`, `||`

### 삼항 연산자 Ternary Conditional Operator

조건을 판단한 후, 실행할 코드를 결정하는 조건 연산자.

- Syntax

  ```swift
  condition ? expr1 : expr2
  ```

- 조건

  - `condition` 의 결과가 *Boolean*  타입으로 결과를 출력해야한다.
  - `expr1`, `expr2` 두 결과 표현식의 자료형이 같아야 한다.

### 비트 연산자 Bitwise Operators

데이터의 비트 단위 연산을 수행할 때 사용된다.

- 비트 연산자의 종류

  - `&`, `|`, `~`, `^`

- 비트 시프트(비트 단위 값의 이동)

  - `<<` , `>>`

    ```swift
    // ex.
    let a: UInt8 = 0b0010_0010
    a << 2
    ```

    > 위 코드를 실행한 결과 `1000_1000` 비트가 된다.

### 범위 연산자 Range Operators

- Closed Range Operator

  ```swift
  // Example
  a ... b
  a...
  ...b
  (1 ... 10)
  (10 ... 1)		// 값을 내림차순으로 위치시키면 오류를 출력한다.
  (1 ... 10).reversed()
  ```

  > 해당 연산자에서는 각 시작과 끝 값을 포함한다.

- Half-open Range Operator

  ```swift
  // Example
  a ..< b
  ..<a	// 띄어쓰기X
  ```

  > Upperbound 가 범위에 속하지 않는 연산자 이다.

- One-side Range

  ```swift
  let range = ...5    //lowerbound 는 무한대가 된다.
  range.contains(7)
  range.contains(1)
  ```

### Short-circuit Evaluation

스위프트는 결과를 얻는데 최소한의 코드만 실행한다. 예를 들어, 논리 연산자가 논리식을 평가 할 때 `a || b` 라는 비교 식이 있다면 `a` 연산을 통해 결과를 만족했다면 `b`를 실행하지 않는다.(이걸 `단락평가`라고 한다.)

- 단락평가 예시

  ```swift
  var n1 = 1
  var n2 = 1
  
  func updateLeft() -> Bool {
      n1 += 1
      return true
  }
  
  func updateRight() -> Bool {
      n2 += 1
      return true
  }
  
  if updateLeft() || updateRight() {
      
  }
  ```

  > n1 == 2
  >
  > n2 == 1

- **Side Effect** : 코드의 실행결과로 인해서 값 또는 상태가 변화되는 것.

## Conditional & Loop Statement

> *Token : 더 이상 나눌 수 없는 것*
>
> *Expression : 토큰이 모여서 하나의 값이 생성 되는 것*
>
> *Statement : 하나 이상의 표현식이 모여서 문장이 되는 것*

- **Basic Syntax**

  ```swift
  if condition {
  	// statements
  } else if condition {
    // statements
  } else {
  	// statements
  }
  ```

- **Switch statement** : 값의 일치 여부에 따라 실행 여부 결정하는 분기문

  ```swift
  // 값 매칭 Pattern matching
  switch value {
  case pattern:
      code
  case pattern, pattern:	// 여러 개의 패턴을 추가할 때
      code
  case pattern where condition:	// 해당 값에 맞을 때 조건을 추가할 수 있다.
      code
  default:
      code
  }
  
  // 범위 매칭 Interval matching
  let temperature = -8
  
  switch temperature {
  case ...10:
      print("cold")
  case 11 ... 20:
      print("cool")
  case 21 ... 27:
      print("warm")
  default:
      print("hot")
  }
  
  // Fall Through
  let temperature = 12
  
  switch temperature {
  case ...10:
      print("cold")
  	  fallthrough
  case 11 ... 20:
      print("cool")
    	fallthrough
  case 21 ... 27:
      print("warm")
  default:
      print("hot")
  }
  ```

  - **Fall through** : 기본적으로 `switch` 문은 위에서 부터 아래로 실행되는데 여기서 해당하는 패턴이 발견되면 `switch` 문을 빠져 나온다. 하지만 `fallthrough` 를 사용하면 다음 `case`의 조건의 일치여부와 상관없이, 다음 `fallthrough` 명령어가 없을 때 까지 출력하고 `switch` 문장을 빠져나온다.

- **guard statement**

  ```swift
  guard condition else {
      statements
  }
  ```

  > 원하는 조건이 충족되지 않으면 불필요한 코드는 실행하지 않고 *Early Exit* 하기 위한 조건문이다.
  >
  > If 조건문으로 충분히 구현할 수 있으나 조건을 중첩하지 않고 간결하게 작성할 수 있는 것이 장점이다.

### 반복문 Loop statement

- **Basic Syntax**

  ```swift
  for loopConstant in Range {
  	// statements
  }
  ```

- **Examples**

  ```swift
  // Ex.1
  for idx in 1 ... 10 {
  	print(idx)
  }
  
  // Ex.2 범위 연산자 말고 stride() 를 사용해서 범위 출력
  for num in stride(from: 0, to: 10, by: 2) {
      print(num)
  }
  
  // Ex.3 리스트 자료형 출력
  let list = ["do", "something", "whatever"]
  for i in list {
      print(i)
  }
  ```

  - `_` (Wildcard Pattern) : 값을 받았지만 무시하는 패턴
  - `Stride(from: , to, by: )` : `from` 에서 `to` 까지  `by` 크기로 범위 변경

- **While Loop**

  ```swift
  while condition {
    // statements
  }
  ```

- **Repeat-while**

  ```swift
  repeat {
  	// statements
  }	while condition
  ```

  > *statement*를 먼저 한 번 실행하고 *while* 뒤 *condition* 을 평가하고 *false* 인 상황까지 반복 실행한다.

### Control Transfer Statements, Labeled Statements

- 흐름 제어 구문 Control Transfer Statements

  ```swift
  for idx in 1 ... 100 {
    	print("start")
      if idx < 5 {
          continue		// Control transfer, 현재 반복을 종료하고 다음 반복문을 실행.
      }
      if idx > 10 {
          break				// Control transfer
      }
  		print("end")
  }
  ```

  > `continue` 와 `break` 문은 조건에 따라 흐름을 제어한다. 가장 인접한 반목문에서 실행된다. 특히 `continue` 는 반복문에서만 사용할 수 있다.

- **Labled Statement** : 문장에 이름을 붙이는 구문

  ```swift
  // Example
  outer: for i in 1 ... 3 {
      print("outer loop", i)
      for j in 1 ... 3 {
          print(" inner loop", j)
          break outer
      }
  }
  ```

  > `break` 문은 기본적으로 가장 인접한 반복문을 종료시키지만, 문장에 이름을 붙이고 그 문장을 종료시킬 수 있다.

## Optionals

> 스위프트에서 `값이 없음` 을 표현하는 방식이다. 이를 나타내는 특별한 값인 `nil`과 옵셔널 형식에 저장된 값을 추출하는 방식을 정리했다.

- Example

  ```swift
  let optionalNum: Int? = nil
  ```

  > 값을 `nil` 로 초기화 할 때는 반드시 자료형 지정(Type annotation)을 해야한다. *Objective-C* 에서는 존재하지 않는 객체에 대한 포인터이다. 스위프트에서는 단순히 값이 없음을 나타낸다.

  - **Optional Type** : `?` 기호는 옵셔널 타입 지정을 나타내는 기호이다. 값을 초기화 시에 `?` 를 생략하면 컴파일 되지 않는다.

- **Unwrapping**

  ```swift
  var num: Int? = nil
  print(num)
  num = 123
  print(num)
  
  let n = 123
  print(n)
  ```

  - **Forced Unwrapping**

    ```swift
    // OptionalExpr!
    print(num)
    print(num!)
    
    // 다만 경고를 출력하기 때문에, 꺼낼 값이 있을 때만 출력할 수 있도록 아래처럼 사용한다.
    if num != nil {
      print(num!)
    }
    ```

    > `!` 기호를 사용하면 옵셔널 데이터가 있는 변수에 저장된 값을 강제로 추출한다. 옵셔널 변수가 값이 없을 때 강제 추출을 시도하면 오류를 출력한다.

    ```swift
    num = 123
    let before = num        //before에 옵셔널 타입으로 그대로 저장
    let after = num!        // 강제로 Unwrapping 하며 일반 Int로 저장된다.
    ```

- **Optional Binding** : 옵셔널을 안전하게 처리하는 방법

  ```swift
  // Sample
  if let na
  ```

- **Implicitly Unwrapped Optionals** : 자동으로 추출되는 옵셔널

  ```swift
  Type!
  ```

  > 자료형 뒤에 `!` 를 붙인다.

## Functions

> 함수를 활용하는 가장 큰 장점은 재사용성(Reusability) 이다. 스위프트에는 *Swift Standard Library* 라는 제공되는 함수들이 있다.

- **Calling Functions**

  ```swift
  // functionName(parameters)
  print("DoSomething")
  ```

- **Defining Functions**

  ```swift
  func name(parameters) -> ReturnType {
  	// statements
    return expr				// 리턴값이 없는 void 형식이면 return 생략
  }
  ```

  > 함수 이름은 lowerCamelCase 형식으로 작성한다. 파라미터는 생략할 수 있다. `Return Arrow` 와 뒤에 리턴 타입을 지정하여 함수의 결과로 리턴 값의 자료형 형식을 지정한다.

- **파라미터 사용하기**

  ```swift
  // Ex.
  func newAdd(a: Int, b: Int) -> Int {
      // a = 12  Error(파라미터로 들어오는 변수는 임시 상수가 된다.)
      return a + b
  }
  ```

- **Default Value**

  ```swift
  // ..(name: Type = Value)
  func sayHi(to: String = "Stranger") {
      print("Hello, \(to)")
  }
  sayHi(to: "Swift")		// Hello, Swift
  sayHi()								// Hello, Stranger
  ```

- **Argument Label**

  - 함수에 사용되는 인자에 라벨을 붙일 수 있다는 것을 의미한다. 이 개념을 사용하는 가장 큰 목적은 **함수 이름의 가독성을 높이기 위해서** 이다. 

  - `(name: Type)` : **name** 이라는 변수명이 `Parameter Name` 과 `Argument Label` 의 역할을 동시에 하고 있다.

  - `(label name: Type)` : label 을 따로 붙여주어 `Parameter Name` 과 `Argument Label` 의 역할을 나누어 함수 사용 시에 가독성을 높여준다.

    ```swift
    // Ex.
    func sayHello2(name: String) {
        print("Hello, \(name)")
    }
    sayHello2(name: "Swift")
    
    func sayHello3(to name: String) {
        print("Hello, \(name)")
    }
    sayHello3(to: "Swift")
    
    // Label 생략(와일드카드 패턴 사용)
    func sayHello4(_ name: String) {
        print("Hello, \(name)")
    }
    sayHello4("Swift")
    ```

    > Label 을 붙이고 위의 함수와 동일하게 변수명을 사용하여도 에러를 출력하지 않는다. *Argument Label*은 함수를 호출할 때 쓴다. *Wildcard Pattern* 을 사용하여 생략할 수 있다. 생략한 경우 값만 입력한다.

- **Varidic Parameters**

  ```swift
  // Ex.
  ```

## Closures

> **Closure** 는 비교적 짧고 독립적인 코드 구조 이며, 스위프트에서는 **Code Block** 이라고 하며 **Java** 에서는 **Lambda** 라 불린다.
>
> 스위프트에서는 세 가지 클로저를 제공하며 일반적인 함수와 중첩함수는 Named Closures 라고 하며, 이름이 없는 함수는 Unnamed Closures 라고 한다.

- **Syntax**

  ```swift
  { (parameter) -> ReturnType in
  	// statement
  }
  	{statement}
  ```

  > 파라미터와 리턴타입을 지정하는 것은 함수와 유사하며, `in` 키워드를 통해 *Closure Head and Body* 를 구분한다.

- **Closure Syntax Optimization**

  - 스위프트는 컴파일러가 추론할 수 있는 부분을 생략하고, 문법 최적화를 통해서 단순화 하는 방식을 추구한다.

  - 종류 : `Implicit Return`, `Trailing Closures`, `Shorthand Argument Names`

    ```swift
    var proModels = products.filter({ (name: String) -> Bool in
        return name.contains("Pro")
    })
    
    // 1. 클로저 형식에서 파라미터 자료형과 리턴타입을 생략할 수 있다.
    products.filter({ (name) in
        return name.contains("Pro")
    })
    
    // 2. 파라미터의 이름을 Shorthand Argument Name 으로 대체할 수 있다.(파라미터 이름과 'in' 키워드 생략)
    products.filter({
        return $0.contains("Pro")
    })
    
    // 3. Implicit returns : 리턴 키워드 생략
    products.filter({
        $0.contains("Pro")
    })
    
    // 4. 클로저 파라미터가 마지막 파라미터라면 Trailing Closure 로 작성한다.
    products.filter() {
        $0.contains("Pro")
    }
    ```

- **Capturing Values**

  ```swift
  // Ex.
  var num = 0
  let c = {
    num += 1			// 연산 적용되는지 확인
    print("check point #1: \(num)")
  }
  c()
  ```

  > 클로저 내부에서 외부에 정의된 값을 접근하려고 할 때 값을 복사하는 것이 아니라 원본을 그대로 참조한다.

## Tuples

> Scalar Type : 하나의 값을 저장하는 타입(`Int`, `String` 등 일반적인 자료형)
>
> Compound Type : 튜플과 같이 여러 개를 동시에 저장.

- **Syntax**

  ```swift
  // Original(expr1, expr2, ...)
  let data = ("<html>", 200, "OK", 12.34)
  ```

  > 값을 나열하면 된다.

  ```swift
  // Named Tuple
  let named = (body: "<html>", statusCode: 200, statusMessage: "OK", dataSize: 12.34)
  
  // 가독성이 좋아진다.
  named.statusCode
  ```

- **주의사항** :

  - 다양한 자료형을 한번에 입력할 수 있다.
  - 튜플의 값을 삭제 및 추가할 수 없다.
  - `tupleExpr.n` : `n` 의 인덱스 를 활용하여 튜플 표현식에 접근할 수 있다.

- **tuple Decomposition(분해)**: 튜플로 된 자료형을 개별 상수, 변수에 저장하는 방식

  ```swift
  let data = ("<html>", 200, "OK", 12.34)
  let (body, code, message, _) = data
  ```

  > 만들고 싶지 않은 변수는 Wildcard Pattern 으로 받는다.

## Characters and Strings

> 스위프트에서 문자와 문자열 다루기. 문자열은 구조체 형식으로 구현되어있다.

1. *String : 구조체로 구현되어있음(Swift String)*
2. *NSString : 참조 형식으로 구현되어있음(Foundation String)*



- **String Indices**

  ```swift
  
  ```

  > 스위프트에서는 문자열 인덱스를 정수로 참조할 수 없다. 유니코드의 독립적인 형태로 문자열을 처리하기 때문이다.

- **Substring**

  ```swift
  let str = "Hello Swift"
  var first = str.prefix(1)		// H
  
  // 새로운 메모리 공간에 저장하고 싶을 때
  let newStr = String(str2.prefix(3))
  ```

  > 스위프트의 이전 버전에서 Substring 을 진행하면 새로운 메모리 공간을 할당하여 저장했지만, 현재 버전은 원본 문자열을 공유한다.(Copy on Write Optimization)



## Collection

> .

- **Foundation Collection 과 Swift Collection 의 비교**

- **Array**

  ```swift
  // Array Literal
  [elem, elem, elem, ...]
  
  // 자료형 선언: 정식 문법 Array<Type>, 단축문법 [T]
  let strArr: Array<String>
  let strArr2: [String]
  ```

  > 0-based Index, 값과 관계없이 동일한 자료형만 담을 수 있다.
  >
  > 자료형을 지정하려고 할 때, 타입 지정은 `Array<Type>` 으로 선언할 수 있고, 단축문법으로 `[T]` 를 사용할 수 있다.

  - Examples

- **Dictionary**

  ```swift
  // Dictionary Literal
  // [key: value, key: value, ...]
  var dict = ["A": "Apple", "B": "Banana"]
  var annoDict = [:]
  
  // 자료형 선언: 정식 문법 Dictionary<K,V>, 단축문법 [K:V]
  let dict1: Dictionary<String, Int>
  let dict2: [String: Int]
  ```

  > 딕셔너리 자료형 선언의 두 가지 방식. 특히 아래 두 번째 Type Annotion 방식에서 `.` 및 `:` 사용에 주의해야한다. 

- **Set**

  ```swift
  // 자료형 선언: Set<T>
  ```

  > Set 자료형은 리터럴이 없고, 배열 형식처럼 사용한다.

  - 주로 검색속도가 중요할 때, 배열 대신 사용한다.
  - 정렬되지 않고, 인덱스를 사용하지 않음.
  - 동일한 값은 하나만 저장한다.

- **Iterating Collections**

### Enumeration

열거형은 독립적인 자료형으로 사용된다. 코드의 가독성과 안정성이 높아진다.

- Syntax

  ```swift
  
  ```

- Raw values

  ```swift
  enum TypeName: RawValueType {
    case caseName = value
  }
  ```

  - 내부에 또 다른 값인 원시값은 필수가 아니지만 필요할 때가 있다.
  - `RawValueType` : 원시값의 자료형을 지정. `String`, `Character`, `Number Types` 만 지정할 수 있다.

### Structure And Class

- **Syntax**, Structure

  ```swift
  struct StructName {
  	// property
  	// method
  	// initializer
  	// subscript
  }
  ```

- **Syntax**, Class

  ```swift
  class ClassName {
  	// property
  	// method
  	// initializer
    // deinitializer
  	// subscript
  }
  ```

- **Initializer Syntax** 

  ```swift
  init(parameter) {
  	//statement
  }
  ```

  > 모든 생성자는 초기값을 가진다.

## Properties

> 여러 속성에 대해서 정리

- Lazy Stored Properties(지연속성)

  ```swift
  lazy var name: Type = DefaultValue
  ```

  > 일반적으로 저장속성은 초기값을 가질 때부터 시작이지만, 지연속성은 처음 접근 시 부터 저장되는 것을 말한다.

- 

## Others

- 값 출력하기(print)

  ```swift
  print(값, 변수등)
  ```

- 자료형의 형식 확인

  ```swift
  type(of: 변수)
  ```




## References

- [어서와, Swift는 처음이지? / 프로그래머스](https://programmers.co.kr/learn/courses/9873)
- 

```
딕셔너리 자료형 선언의 두 가지 방식 특히 아래 두 번째 
```

