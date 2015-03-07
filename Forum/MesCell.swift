//
//  MesCell.swift
//  Forum
//
//  Created by Ozan Asan on 07/03/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import UIKit

class MesCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var body: UITextView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
