//
//  DataManager.swift
//  Useless_App
//
//  Created by Rayane Xavier on 16/04/20.
//  Copyright © 2020 Rayane Xavier. All rights reserved.
//

import UIKit
import CoreData

class DataManager {
    
    // MARK: - Core Data stack
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Useless_App")
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
        
        func sceneDidEnterBackground(_ scene: UIScene) {
            (UIApplication.shared.delegate as? DataManager)?.saveContext()
        }
    }
}
