//
//  Database.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import CoreData

class Database{
    static let shared = Database()
    let containerName = "Project"
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    private lazy var saveManagedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentContainer.persistentStoreCoordinator
        return managedObjectContext
    }()
    lazy var managedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.parent = saveManagedObjectContext
        return managedObjectContext
    }()
    
}
extension Database{ 
    func saveContext () {
        guard managedObjectContext.hasChanges || saveManagedObjectContext.hasChanges else{
            return
        }
        managedObjectContext.performAndWait {
            do{
                try managedObjectContext.save()
            }catch let error{
                fatalError(error.localizedDescription)
            }
        }
        saveManagedObjectContext.perform {
            do{
                try self.saveManagedObjectContext.save()
            }catch let error{
                fatalError(error.localizedDescription)
            }
        }
    }
}
