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
    
    
    override init() {
        super.init(style: UITableViewStyle.Plain)
        
        //I had to add this to remove tab bar items in the detail screen. I probably made a mistake ot
        //I believe that it should disappear already.
        self.tabBarController?.hidesBottomBarWhenPushed = true
    }
    
    //had to impelement this
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tabBarController?.hidesBottomBarWhenPushed = true
    }
    
    //had to implement this.
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.tabBarController?.hidesBottomBarWhenPushed = true
    }
    

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
        
        
        
        
        //self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"
        tableView.registerNib(UINib(nibName: "MesCell", bundle:nil), forCellReuseIdentifier: "messageCell")
        //self.tableView.registerClass(aClass: MesCell(), forHeaderFooterViewReuseIdentifier: "messageCell")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 3
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath) as MesCell
        
        cell.picture.image = UIImage(named: "r2d2.png")
        cell.body.text = "Deneme Bir Ki"
        
        //cell.body.text = "DENEME"

        //cell.picture.image = UIImage(named: "r2d2.png")

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    // Footer button
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
