//
//  SendMessageViewController.swift
//  Forum
//
//  Created by Ozan Asan on 07/03/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import UIKit

class SendMessageViewController: UIViewController {
    
    @IBOutlet weak var messageBody: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipe = UISwipeGestureRecognizer(target: self, action: "handleSwipe:")
        messageBody.addGestureRecognizer(swipe)
    }
    
    var currentGroupName : String?
    
    func handleSwipe(sender:UISwipeGestureRecognizer) {
        sendMessage()
    }
    
    @IBAction func sendMessage() {
        WebService().sendMessage(curentMessage())
    }
    
    func curentMessage() -> Message {
        let message = Message()
        message.body = messageBody.text
        message.date = NSDate()
        message.group = currentGroupName!
        
        return message
    }
    
    
}
