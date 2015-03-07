//
//  MessageListViewController.swift
//  Forum
//
//  Created by Ozan Asan on 06/03/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import UIKit

/*


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
return 100.0f;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
if(tableView == myListTableview) //hear u can make decision
{
UIView *footerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
UIButton *addcharity=[UIButton buttonWithType:UIButtonTypeCustom];
[addcharity setTitle:@"Add to other" forState:UIControlStateNormal];
[addcharity addTarget:self action:@selector(addCharity:) forControlEvents:UIControlEventTouchUpInside];
[addcharity setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//set the color this is may be different for iOS 7
addcharity.frame=CGRectMake(0, 0, 130, 30); //set some large width to ur title
[footerView addSubview:addcharity];
return footerView;
}
}

- (void)addCharity:(id)sender
{
NSLog(@"add to charity");
}

*/
class MessageListViewController: UITableViewController {
    
    var MessageList : [Message]?
    var GroupName : String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        if let count = MessageList {
            self.navigationItem.title = "Messages In \(self.GroupName!)"
        }
        
        else {
            self.navigationItem.title = "No Messages In \(self.GroupName!)"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 3
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel!.text = "The Message kwejhkjefhkje kdsjfhjsdkf ksdjfhsdjkhfkdsf skcfjhdskjfhksdjf sdkfjhskdfjhskjdf sdkfjhskdjfhksjdf sdkjfhdkjfhjdksf ksdjfhsdkjhskdjf sdkfjhsdkjfhdksjf dsfkjhsdkfhkjsdf kjhsdkfsdhfksdj sdkfjhskdhfjksdf sdkfjhdskjfsdkf sdkfjhsdjkfhsdkjfd sdkjfhsjkdfhsdk sdkfjsdnsldf sdlfjpweghf flsdfnwef sldkflaknf lkfsdjfwpşkefn akdfpwefkwlknçasnfk"

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        //let footerView = UIView(frame: CGRectMake(0, 300, 320, 20))
        var sendMessage : UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        sendMessage.setTitle("SAY SOMETHING", forState: UIControlState.Normal)
        sendMessage.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20.0)
        sendMessage.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        sendMessage.backgroundColor = UIColor.blackColor()
        sendMessage.addTarget(self, action: "addMessage", forControlEvents: UIControlEvents.TouchUpInside)
        //sendMessage.frame = CGRectMake(0, 0, 20, 20)
        
        
        //footerView.backgroundColor = UIColor.redColor()
        
        //footerView.addSubview(sendMessage)
        return sendMessage
    }
    
    func addMessage() {
        println("Button is tapped")
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
