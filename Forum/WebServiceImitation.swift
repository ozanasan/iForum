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
    
    let appDelegate : AppDelegate
    let managedContext : NSManagedObjectContext
    let currentUser : Member
    
    init() {
        appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        managedContext = appDelegate.managedObjectContext!
        currentUser = Member.sharedInstance
    }
    
    func getUserGroups() -> [Group]? {
        var groups : [Group] = []
        let fetchRequest = NSFetchRequest(entityName:"Group")
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest,
            error: &error) as [NSManagedObject]?
        
        if let results = fetchedResults {
            
            for model in results {
                var group : Group = Group()
                group.groupName = model.valueForKey("name") as String
                group.creatorFirstName = model.valueForKey("creator") as? String
                groups.append(group)
            }
            
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        return groups
    }
    
    func addGroups(newGroup : Group) {
        let entity =  NSEntityDescription.entityForName("Group",
            inManagedObjectContext:
            managedContext)
        let group = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext)
        
        group.setValue(newGroup.groupName, forKey: "name")
        group.setValue(currentUser.userName, forKey : "creator")
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
    }
    
    func sendMessage(newMessage : Message) {
        let entity =  NSEntityDescription.entityForName("Message",
            inManagedObjectContext:
            managedContext)
        let message = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext)
        
        message.setValue(newMessage.body, forKey: "body")
        message.setValue(newMessage.group, forKey : "group")
        message.setValue(newMessage.date, forKey : "date")
        message.setValue(currentUser.userName, forKey : "sender")
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
    }
    
    func getMessages(groupName: String) -> [Message]? {
        
        var messages = [Message]()
        
        var fetchRequest = NSFetchRequest(entityName: "Message")
        let resultPredicate = NSPredicate(format: "group = %@", groupName)
        
        var compound = NSCompoundPredicate.andPredicateWithSubpredicates([resultPredicate!])
        fetchRequest.predicate = compound
        
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest,
            error: &error) as [NSManagedObject]?
        
        if let results = fetchedResults {
            for model in results {
                let message = Message()
                message.body = model.valueForKey("body") as String
                message.group = model.valueForKey("group") as String
                message.date = model.valueForKey("date") as NSDate
                message.senderName = model.valueForKey("sender") as String
                messages.append(message)
            }
            
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        return messages
        
    }
}