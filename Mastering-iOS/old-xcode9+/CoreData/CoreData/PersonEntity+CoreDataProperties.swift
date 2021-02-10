//
//  PersonEntity+CoreDataProperties.swift
//  CoreData
//
//  Created by 이동규 on 2021/02/10.
//  Copyright © 2021 Keun young Kim. All rights reserved.
//
//

import Foundation
import CoreData


extension PersonEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonEntity> {
        return NSFetchRequest<PersonEntity>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var address: String?

}
