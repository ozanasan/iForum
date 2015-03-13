//
//  LoginLogic.swift
//  Forum
//
//  Created by Ozan Asan on 01/03/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import Foundation

func shouldLogin(name : String?, password : String?, sender : LoginViewController) -> Bool {
    var shouldLogin : Bool = false
    
    if name! != password! {
        sender.presentOneActionAlarmWithTitle("Login Failed", alarmMessage : "Please Try Again", alarmAction : "Okay")
        
    }
        
    else if (name! == password!) {
        shouldLogin = true
        successfullLogin(name!)
    }
    return shouldLogin
}

func successfullLogin(name : String) {
    
    let member : Member = Member.sharedInstance
    member.userName = name
}
