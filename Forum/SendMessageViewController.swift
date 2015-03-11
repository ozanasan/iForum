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
    
    struct SwipeBit {
        var rightSwipe = false
        var leftSwipe = false
        var upSwipe = false
        var downSwipe = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myRecgonizer = CheckRecognizer(target: self, action: "deneme")
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "handleRightSwipe:")
        swipeRight.direction = .Right
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: "handleDownSwipe:")
        swipeDown.direction = .Down
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "handleLeftSwipe:")
        swipeLeft.direction = .Left

        let swipeUp = UISwipeGestureRecognizer(target: self, action: "handleUpSwipe:")
        swipeUp.direction = .Up
        
        //messageBody.addGestureRecognizer(swipeRight)
        //messageBody.addGestureRecognizer(swipeLeft)
       //messageBody.addGestureRecognizer(swipeUp)
        //messageBody.addGestureRecognizer(swipeDown)
        messageBody.addGestureRecognizer(myRecgonizer)
    }
    
    var currentGroupName : String?
    
    func handleRightSwipe(sender:UISwipeGestureRecognizer) {
        println("RIGHT")
        sender.enabled = false
        sender.enabled = true
    }
    
    func handleLeftSwipe(sender:UISwipeGestureRecognizer) {
        println("LEFT")
        sender.enabled = false
        sender.enabled = true
    }
    
    func handleUpSwipe(sender:UISwipeGestureRecognizer) {
        println("UP")
        sender.enabled = false
        sender.enabled = true
    }
    
    func handleDownSwipe(sender:UISwipeGestureRecognizer) {
        println("DOWN")
        sender.enabled = false
        sender.enabled = true
    }
    
    @IBAction func sendMessage() {
        WebService().sendMessage(curentMessage())
    }
    
    func deneme() {
        println("OHA, OLDU.")
    }
    
    func curentMessage() -> Message {
        let message = Message()
        message.body = messageBody.text
        message.date = NSDate()
        message.group = currentGroupName!
        
        return message
    }
    
    
}
