//: [Previous](@previous)

import Foundation

/*:
 # Variables
 */

var predicate = NSPredicate(format: "%K BEGINSWITH %@", #keyPath(Company.name), "America")

// 키워드를 활용해서 포맷 문자열 가독성 높일 수 있음
predicate = NSPredicate(format: "%K BEGINSWITH $COMPANY_NAME", #keyPath(Company.name)).withSubstitutionVariables(["COMPANY_NAME": "America"])

companies.filtered(using: predicate)

//: [Next](@next)
