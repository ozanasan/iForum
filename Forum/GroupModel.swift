//
//  GroupModel.swift
//  Forum
//
//  Created by Ozan Asan on 28/02/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import Foundation
import UIKit

class Group {
    let creatorFirstName : String?
    let creatorLastName : String?
    var members : [String]?
    var groupName : String
    var groupPic : UIImage?
    var messages : Array<Message>?
    var createDate : NSDate!
    
    init() {
        self.groupName = "Default"
        
        
    }
    
    func postMessage (newMessage: Message) {
        messages!.append(newMessage)
    }
    
    func deleteGroup() {
        //some delete group thing.
    }
    
}
