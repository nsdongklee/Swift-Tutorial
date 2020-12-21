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

