//
//  CoreDataManager.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 12/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit
import CoreData

public class CoreDataManager: NSObject {
    
    public static let shared = CoreDataManager()
        
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Network")
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
    
    public func findAllForEntity(_ entityName: String) -> [AnyObject]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let result: [AnyObject]?
        do {
            result = try persistentContainer.viewContext.fetch(request)
        } catch let error as NSError {
            print(error)
            result = nil
        }
        return result
    }
    
}
