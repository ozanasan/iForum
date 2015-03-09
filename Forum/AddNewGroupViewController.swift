//
//  AddNewGroupViewController.swift
//  Forum
//
//  Created by Ozan Asan on 03/03/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import UIKit

class AddNewGroupViewController: UIViewController {
    
    @IBOutlet weak var GroupName: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "saveGroup" {
            if GroupName.text.isEmpty {
                var alert = UIAlertController(title: "Save Action Fails", message: "Name field is empty!", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            
            else {
                var newGroup : Group = Group()
                newGroup.groupName = GroupName.text
                newGroup.creatorFirstName = Member.sharedInstance.userName!
                WebService().addGroups(newGroup)
            }
        }
    }

}
