//
//  CoreDataStore.swift
//  TableUsers_Lesson
//
//  Created by Дима Губеня on 25.09.2022.
//

import Foundation
import CoreData

protocol CoreDataStoreProtocol {
    var context: NSManagedObjectContext { get }
    
    func saveContext()
    func fetchRequest() -> [MyClient]
    func deleteUsers(id: UUID)
    func updateUser(localUser: MyClient)
}

class CoreDataStore: CoreDataStoreProtocol {
    lazy var context: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "TableUsers_Lesson")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchRequest() -> [MyClient] {
        let fetchRequest: NSFetchRequest<ClientInfoEntity> = ClientInfoEntity.fetchRequest()
        
        do {
            let objects = try context.fetch(fetchRequest)
            return objects.map { MyClient(user: $0) }
        } catch let error {
            print(error)
        }
        
        return []
    }
    
    func deleteUsers(id: UUID) {
        let fetchRequest: NSFetchRequest<ClientInfoEntity> = ClientInfoEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            let objects = try context.fetch(fetchRequest)
            for object in objects {
                context.delete(object)
            }
            saveContext()
            print("Delete")
        } catch {
            print(error)
        }
    }
    
    func updateUser(localUser: MyClient) {
        let fetchRequest: NSFetchRequest<ClientInfoEntity> = ClientInfoEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", localUser.id as CVarArg)
        
        do {
            if let user = try context.fetch(fetchRequest).first {
                user.name = localUser.name
                user.surName = localUser.surName
                
                saveContext()
            }
            
            print("Updated")
        } catch {
            print(error)
        }
    }
}

