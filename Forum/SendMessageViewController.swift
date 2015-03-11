//
//  SendMessageViewController.swift
//  Forum
//
//  Created by Ozan Asan on 07/03/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import UIKit

//In this view controller you can add a message into the group you came from.
class SendMessageViewController: UIViewController {
    
    @IBOutlet weak var messageBody: UITextView!
    var currentGroupName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myRecgonizer = CheckRecognizer(target: self, action: "sendMessage")
        messageBody.addGestureRecognizer(myRecgonizer)
    }
    
    //unwindMessageList unwindSegue is created in storyboard, and its method is in MessageListControllerunwindMessageList
    @IBAction func sendMessage() {
        WebService().sendMessage(curentMessage())
        performSegueWithIdentifier("unwindMessageList", sender: self)
    }
    
    func curentMessage() -> Message {
        let message = Message()
        message.body = messageBody.text
        message.date = NSDate()
        message.group = currentGroupName!
        return message
    }
}
