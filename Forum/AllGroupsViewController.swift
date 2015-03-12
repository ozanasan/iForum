//
//  AllGroupsViewController.swift
//  Forum
//
//  Created by Ozan Asan on 28/02/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import UIKit

class AllGroupsViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var groups : [Group]? = []
    let webService : WebService! = WebService()
    var selectedGroupName : String?
    
    override func viewWillAppear(animated: Bool) {
        self.groups = webService.getUserGroups()
    }
    
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

}
