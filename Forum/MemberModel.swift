//
//  MemberModel.swift
//  Forum
//
//  Created by Ozan Asan on 28/02/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import Foundation

 class MemberModel {
    var memberName : String
    var memberLastName : String?
    var groups : [String]?
    
    
    init() {
        self.memberName = "Default"
    }

}
