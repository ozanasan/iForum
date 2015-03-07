//
//  Message.m
//  Forum
//
//  Created by Ozan Asan on 28/02/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

#import "Message.h"
#import "Forum-Swift.h"

@interface Message()

@property (weak, nonatomic) Member *sender;

@end

@implementation Message

-(Member* )getOwner {
    return self.sender;
}

@end


