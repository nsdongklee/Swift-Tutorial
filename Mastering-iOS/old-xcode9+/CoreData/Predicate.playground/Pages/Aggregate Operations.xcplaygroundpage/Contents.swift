//: [Previous](@previous)

import Foundation
// 컬렋ㄴ과 연관
/*:
 # Aggregate Qualifiers
 */

/*:
 ## ANY, SOME
 */

var predicate = NSPredicate(format: "ANY employees.age >= 50")
departments.filtered(using: predicate)

predicate = NSPredicate(format: "SOME employees.age >= 50")
departments.filtered(using: predicate)


/*:
 ## ALL
 */

predicate = NSPredicate(format: "ALL employees.age BETWEEN {31, 42}")
departments.filtered(using: predicate)


/*:
 ## NONE
 */

predicate = NSPredicate(format: "NONE employees.age < 30")
departments.filtered(using: predicate)


/*:
 ## IN
 */

predicate = NSPredicate(format: "revenue IN {229234.0, 89950.0}")
companies.filtered(using: predicate)


/*:
 # Aggregation Operators
 */

/*:
 ## @count
 */
// 포함된 데이터 수
predicate = NSPredicate(format: "employees.@count < 4")
departments.filtered(using: predicate)

/*:
 ## @avg
 */
// 평균값
predicate = NSPredicate(format: "employees.@avg.age < 30")
departments.filtered(using: predicate)

/*:
 ## @min
 */
// 컬렉션에 포함된 최소값
predicate = NSPredicate(format: "employees.@min.age >= 30")
departments.filtered(using: predicate)

/*:
 ## @max
 */
predicate = NSPredicate(format: "employees.@max.age >= 50")
departments.filtered(using: predicate)

/*:
 ## @sum
 */
// 전체 합
predicate = NSPredicate(format: "employees.@sum.salary >= 300000")
departments.filtered(using: predicate)


/*:
 # Array Operations
 */

// 서브스크립트 문법으로 인덱싱해서 접근 가능
predicate = NSPredicate(format: "employees[0].age >= 35")
departments.filtered(using: predicate)

predicate = NSPredicate(format: "employees[FIRST].age >= 35")
departments.filtered(using: predicate)

// 마지막 요소를 리턴 가능
predicate = NSPredicate(format: "employees[LAST].age >= 35")
departments.filtered(using: predicate)

// 내부 값에 맞게 검색도 가능
predicate = NSPredicate(format: "employees[SIZE] == 6")
departments.filtered(using: predicate)


//: [Next](@next)
