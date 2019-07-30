//
//  CoreDataService.swift
//  Geogramm
//
//  Created by  iDeveloper on 7/30/19.
//  Copyright © 2019  iDeveloper. All rights reserved.
//

import CoreData
import Foundation

class CoreDataService {
  
  // MARK: - Points
  
  func fetchPoints() -> [Point] {
    return fetch() ?? [Point]()
  }
  
  func savePoint(title: String, tag: String?, latitude: Double, longitude: Double) {
    contextOperationHandle { context in
      let point = Point(context: context)
      point.id = UUID().uuidString
      point.date = Date()
      
      point.title = title
      point.tag = tag
      point.latitude = latitude
      point.longitude = longitude
    }
  }
  
  func removePoint(with id: String) {
    contextOperationHandle { context in
      let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Point")
      fetchRequest.predicate = NSPredicate(format: "%K == %@", "id", id)
      let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
      
      do {
        try context.execute(deleteRequest)
      } catch {
        print("Deteting point error:", error.localizedDescription)
      }
    }
  }
  
  // MARK: -
  
  private lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Geogramm")
    container.loadPersistentStores(completionHandler: { _, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()

  // MARK: - Core Data Saving support

  private func contextOperationHandle(_ contextHandler: (NSManagedObjectContext) -> Void) {
    let context = persistentContainer.viewContext
    contextHandler(context)
    saveContext()
  }
  
  private func saveContext() {
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
  
  private func fetch<T: NSManagedObject>(predicate: NSPredicate? = nil) -> [T]? {
    let context = persistentContainer.viewContext
    
    let entityName = String(describing: T.self)
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
    if let predicate = predicate {
      fetchRequest.predicate = predicate
    }
    do {
      return try context.fetch(fetchRequest) as? [T]
    } catch {
      print("Error in fetching \(entityName):", error.localizedDescription)
    }
    
    return nil
  }
}
