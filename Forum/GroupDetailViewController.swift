//
//  GroupDetailViewController.swift
//  Forum
//
//  Created by Ozan Asan on 12/03/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import UIKit

class GroupDetailViewController: UIViewController {
    var groupName:String?
    var userGroupNames:[String]?
    let loggedIn : Member = Member.sharedInstance
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var groupNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        self.groupNameLabel.text = self.groupName!
        
        /*
        if let userGroups = loggedIn.groups {
            for group in userGroups {
                
            }
            
        }
        
        if contains(loggedIn.groups!, self.groupName!) {
            button.titleLabel!.text = "LEAVE THIS GROUP"
        }
        else {
            button.titleLabel!.text = "JOIN THIS GROUP"
            
        }*/
    }
}
