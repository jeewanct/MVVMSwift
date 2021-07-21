//
//  DatabaseHandler.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import CoreData

class DatabaseHandler{
    static let shared = DatabaseHandler()
    private let managedObjectContext = Database.shared.managedObjectContext
    func add<T: NSManagedObject>() -> T?{
        guard let entityName = T.entity().name else {
            fatalError("No entity found")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: managedObjectContext) else {
            fatalError("Cannot create entity")
        }
        return T(entity: entity, insertInto: managedObjectContext)
    }
    func fetch<T: NSManagedObject>() -> [T]?{
        let request = T.fetchRequest()
        do{
            let result = try managedObjectContext.fetch(request)
            return result as? [T]
        }catch let error{
            fatalError(error.localizedDescription)
        }
    }
    func delete<T: NSManagedObject>(type: T.Type){
        let results: [T]? = fetch()
        results?.forEach({ managedObjectContext.delete($0)})
        Database.shared.saveContext()
    }
    
}
