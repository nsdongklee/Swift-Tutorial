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

