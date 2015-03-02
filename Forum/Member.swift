//
//  Member.swift
//  Forum
//
//  Created by Ozan Asan on 01/03/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import Foundation
import UIKit

class Member : NSObject {
    
    let userName :String?
    let lastName : String?
    var groups : [Group]?
    let userPic : UIImage!
    
    init(name : String) {
        self.userName = name
    }
    
    override init() {
        super.init()
    }
    
    // This is for singleton
    class var sharedInstance: Member {
        struct Static {
            static let instance: Member = Member()
        }
        return Static.instance
    }
}


