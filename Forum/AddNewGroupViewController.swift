//
//  AddNewGroupViewController.swift
//  Forum
//
//  Created by Ozan Asan on 03/03/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import UIKit

class AddNewGroupViewController: UIViewController {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "saveGroup" {
            println ("Prepare for segue")
        }
    }

}
