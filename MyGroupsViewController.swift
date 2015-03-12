//
//  MyGroupsViewController.swift
//  Forum
//
//  Created by Ozan Asan on 28/02/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import UIKit

class MyGroupsViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    //constants
    enum MyGroupsSegues : String {
        case messageSegueIdentifier = "ShowMessages"
        case accessorySegueIdentifier = "accessoryFromMy"
    }
    
    var groups : [Group]? = []
    let webService : WebService! = WebService()
    var selectedGroupName : String?
    var accessoryRow : Int?
    
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
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        self.accessoryRow = indexPath.row
    }
    
    //Unwind Segue Methods:
    @IBAction func cancelBackToMyGroups (segue: UIStoryboardSegue) {}
    
    @IBAction func saveGroup (segue : UIStoryboardSegue) {}
    
    //We set necessary variables in the destination view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
                case MyGroupsSegues.messageSegueIdentifier.rawValue:
                    let dest = segue.destinationViewController as MessageListViewController
                    let path = self.tableView.indexPathForSelectedRow()!
                    dest.GroupName = self.groups![path.row].groupName
                    dest.hidesBottomBarWhenPushed = true
                
                case MyGroupsSegues.accessorySegueIdentifier.rawValue:
                    let dest = segue.destinationViewController as GroupDetailViewController
                    let selectedCell = sender as UITableViewCell
                    let row = self.tableView.indexPathForCell(selectedCell)!.row
                    dest.groupName = self.groups![row].groupName
                    dest.hidesBottomBarWhenPushed = true
                default:
                    break
            }
        }
        
        
        
        /*
        if segue.identifier == messageSegueIdentifier {
            let dest = segue.destinationViewController as MessageListViewController
            let path = self.tableView.indexPathForSelectedRow()!
            dest.GroupName = self.groups![path.row].groupName
            dest.hidesBottomBarWhenPushed = true
        }
        */
    }
}
