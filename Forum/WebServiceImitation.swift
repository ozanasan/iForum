//
//  WebServiceImitation.swift
//  Forum
//
//  Created by Ozan Asan on 01/03/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

//This class is imitation of web service methods I might have used.

import Foundation
import CoreData
import UIKit

class WebService {
    
    
    
    func getUserGroups() -> [Group]? {
        
        var groups : [Group] = []
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let fetchRequest = NSFetchRequest(entityName:"Group")
        
        //3
        var error: NSError?
        
        let fetchedResults =
        managedContext.executeFetchRequest(fetchRequest,
            error: &error) as [NSManagedObject]?
        
        if let results = fetchedResults {
            
            for NsModel in results {
                var group : Group = Group()
                group.groupName = NsModel.valueForKey("groupName") as String
                group.creatorFirstName = NsModel.valueForKey("groupCreator") as? String
                groups.append(group)
            }
            
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        return groups
    }
    
    func addGroups(newGroup : Group) {
        
        
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let entity =  NSEntityDescription.entityForName("Group",
            inManagedObjectContext:
            managedContext)
        
        let group = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext)
        
        //3
        group.setValue(newGroup.groupName, forKey: "groupName")
        group.setValue(Member.sharedInstance.userName!, forKey : "groupCreator")
        
        //4
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
    }
}