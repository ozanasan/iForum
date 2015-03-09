//
//  MyGroupsViewController.swift
//  Forum
//
//  Created by Ozan Asan on 28/02/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import UIKit

//constants
let messageSegueIdentifier = "ShowMessages"

class MyGroupsViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var groups : [Group]? = []
    let webService : WebService! = WebService()
    var selectedGroupName : String?
    
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
    
    //Unwind Segue Methods:
    @IBAction func cancelBackToMyGroups (segue: UIStoryboardSegue) {}
    
    @IBAction func saveGroup (segue : UIStoryboardSegue) {}
    
    //We set necessary variables in the destination view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == messageSegueIdentifier {
            let dest = segue.destinationViewController as MessageListViewController
            let path = self.tableView.indexPathForSelectedRow()!
            dest.GroupName = self.groups![path.row].groupName
            dest.hidesBottomBarWhenPushed = true
        }
    }
}
