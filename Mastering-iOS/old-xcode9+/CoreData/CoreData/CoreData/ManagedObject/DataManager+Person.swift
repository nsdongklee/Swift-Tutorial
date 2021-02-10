//
//  DataManager+Person.swift
//  CoreData
//
//  Created by 이동규 on 2021/02/10.
//  Copyright © 2021 Keun young Kim. All rights reserved.
//

import Foundation
import CoreData

extension DataManager {
    func createPerson(name: String, age: Int? = nil, completion: (() -> ())? = nil) {
        
        // 메인쓰레드와 동일한 공간에서 구현되도록
        mainContext.perform {
            // Shared에 만들어둔 Person 클래스 사용
            let newPerson = PersonEntity(context: self.mainContext)
//            newPerson.setValue(name, forKey: "Person")
            // setValue 속성에 접근하지 않아도 바로 값에 접근할 수 있다.
            newPerson.name = name
            if let age = age {
                newPerson.age = Int16(age)
            }
            
            // 새로 추가한 데이터 저장
            self.saveMainContext()
            completion?()
        }
    }
    
    // 가져온 데이터를 배열로 리턴하기
    func fetchPerson() -> [PersonEntity] {
        
        // 빈 배열 먼저 선언
        var list = [PersonEntity]()
        
        // 블록 내부에서 배열로 바로 리턴할 수 없기때문에 다른 메소드 활용
        mainContext.performAndWait {
            let request: NSFetchRequest<PersonEntity> = PersonEntity.fetchRequest()
            
            let sortByName = NSSortDescriptor(key: #keyPath(PersonEntity.name), ascending: true)
            request.sortDescriptors = [sortByName]
            
            do {
                list = try mainContext.fetch(request)
            } catch {
                print(error)
            }
        }
        return list
    }
    
    func updatePerson(entity: PersonEntity, name: String, age: Int? = nil, completion: (() -> ())? = nil) {
        mainContext.perform {
            entity.name = name
            if let age = age {
                entity.age = Int16(age)
            }
            self.saveMainContext()
            completion?()
        }
    }
    
    func delete(entity: PersonEntity) {
        mainContext.perform {
            self.mainContext.delete(entity)
            self.saveMainContext()
        }
    }
}
