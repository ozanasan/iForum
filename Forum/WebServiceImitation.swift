//
//  WebServiceImitation.swift
//  Forum
//
//  Created by Ozan Asan on 01/03/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

//This class is imitation of web service methods I might have used.

import Foundation

class WebService {
    
    var groups : [Group] = []
    
    func getUserGroups() -> [Group]? {
        
        println("Hey.. I am the web service, and I know the name of the session user as \(Member.sharedInstance.userName), I hope this is true.")
        
        let group1 : Group = Group()
        group1.creatorFirstName = "Mike"
        group1.creatorLastName = "Heath"
        group1.groupName = "Pink Floyd Concert"
        
        let group2 : Group = Group()
        group2.creatorFirstName = "Tim"
        group2.creatorLastName = "Brey"
        group2.groupName = "Swift Programming Language"
        
        let group3 : Group = Group()
        group3.creatorFirstName = "Mehmet"
        group3.creatorLastName = "Aydın"
        group3.groupName = "Fenerbahce"
        
        
        groups.append(group1)
        groups.append(group2)
        groups.append(group3)
        
        return groups
    }
    
    func addGroups(newGroup : Group) {
        
        groups.append(newGroup)
    }
    
    
    
}
