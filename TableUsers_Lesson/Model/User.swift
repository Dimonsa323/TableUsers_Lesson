//
//  User.swift
//  TableUsers_Lesson
//
//  Created by Дима Губеня on 22.09.2022.
//

import Foundation

struct MyClient {
    let name: String
    let surName: String
    let age: Int16
    let id: UUID
    
    init(name: String, surName: String, age: Int16) {
        self.name = name
        self.surName = surName
        self.age = age
        self.id = UUID()
    }
    
    init(user: ClientInfoEntity) {
        self.name = user.name ?? ""
        self.surName = user.surName ?? ""
        self.age = user.age
        self.id = user.id ?? UUID()
    }
}
