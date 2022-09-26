//
//  ClientInfoEntity+CoreDataProperties.swift
//  TableUsers_Lesson
//
//  Created by Дима Губеня on 25.09.2022.
//
//

import Foundation
import CoreData


extension ClientInfoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClientInfoEntity> {
        return NSFetchRequest<ClientInfoEntity>(entityName: "ClientInfoEntity")
    }

    @NSManaged public var age: Int16
    @NSManaged public var name: String?
    @NSManaged public var surName: String?
    @NSManaged public var id: UUID?

}

extension ClientInfoEntity : Identifiable {

}
