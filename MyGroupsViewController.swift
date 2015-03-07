//
//  MyGroupsViewController.swift
//  Forum
//
//  Created by Ozan Asan on 28/02/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import UIKit

let messageSegueIdentifier = "ShowMessages"

class MyGroupsViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var groups : [Group]? = []
    let webService : WebService! = WebService()
    var selectedGroupName : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.allowsSelection = true
        self.groups = webService.getUserGroups()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.groups = webService.getUserGroups()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("groupCell", forIndexPath: indexPath) as UITableViewCell

        let tempGroup : Group = self.groups![indexPath.row]
        
        cell.textLabel!.font = UIFont(name: "Helvetica-Bold", size: 20.0)
        
        cell.textLabel!.text = tempGroup.groupName
        cell.detailTextLabel!.text = "by " + tempGroup.creatorFirstName!
        
        return cell
    }
    
    /*
    //this is what happens when a user taps on a cell
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    */
    
    @IBAction func cancelBackToMyGroups (segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func saveGroup (segue : UIStoryboardSegue) {
        
        println ("saveGroup")
        self.tableView.reloadData()
        
    }
    
    //we set necessary variables in the destination view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == messageSegueIdentifier {
            let dest = segue.destinationViewController as MessageListViewController
            let path = self.tableView.indexPathForSelectedRow()!
            dest.GroupName = self.groups![path.row].groupName
            dest.hidesBottomBarWhenPushed = true
        }
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
