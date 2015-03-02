//
//  LoginViewController.swift
//  Forum
//
//  Created by Ozan Asan on 01/03/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    
    //login control inside should perform segue
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        
        var shouldPErform : Bool = false
        
        if identifier! == "loginToTab" {
            let name : String = userName.text
            let myword = password.text
            
            if name != myword {
                var alert = UIAlertController(title: "LOGIN FAILED", message: "You can try again", preferredStyle: UIAlertControllerStyle.Alert)
                
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alert, animated: true, completion: nil)
            }
                
            else if (name == myword) && !name.isEmpty {
                shouldPErform = true
            }
            
        }
        return shouldPErform
    }
}
