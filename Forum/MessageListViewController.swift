//
//  MessageListViewController.swift
//  Forum
//
//  Created by Ozan Asan on 06/03/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import UIKit

//constants
let sendMessageSegue = "sendMessageSegue"
let cellHeight : CGFloat = 30.0

class MessageListViewController: UITableViewController {
    
    var MessageList : [Message]?
    var GroupName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "MesCell", bundle:nil), forCellReuseIdentifier: "messageCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        MessageList = WebService().getMessages(GroupName!)
        
        if let count = MessageList {
            self.navigationItem.title = "Messages In \(self.GroupName!)"
        }
            
        else {
            self.navigationItem.title = "No Messages In \(self.GroupName!)"
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageList!.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath) as MesCell
        let message = MessageList![indexPath.row]
        
        cell.body.text = message.body
        cell.name.text = message.senderName
        cell.picture.image = UIImage(named: "r2d2.png")
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return cellHeight
    }
    
    //Adding footer button programatically
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return prepareButton()
    }
    
    //This method creates the send message button in the footer.
    private func prepareButton() -> UIButton? {
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.setTitle("SAY SOMETHING", forState: UIControlState.Normal)
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20.0)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.backgroundColor = UIColor.blackColor()
        button.addTarget(self, action: "addMessage", forControlEvents: UIControlEvents.TouchUpInside)
        return button
    }
    
    //Footer button action - selector
    func addMessage() {
        sendMessageScreen()
    }
    
    //Unwind Segue Method(s):
    @IBAction func messageSent(segue : UIStoryboardSegue) {}
    
    //Segue methods:
    func sendMessageScreen() {
        performSegueWithIdentifier(sendMessageSegue, sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == sendMessageSegue) {
            let destination = segue.destinationViewController as SendMessageViewController
            destination.currentGroupName = GroupName!
        }
    }
}
