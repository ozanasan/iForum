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
        
        switch(identifier!) {
            case "loginToTab":
                if(!userName.text.isEmpty) {
                    return shouldLogin(userName.text, password.text, self)
                }
                else {
                    return false
                }
            default:
                return false
        }
    }
    
    func presentOneActionAlarmWithTitle(alarmTitle : String, alarmMessage : String, alarmAction :String) {
        var alert = UIAlertController(title: alarmTitle, message: alarmMessage, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: alarmAction, style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
