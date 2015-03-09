//
//  Message.h
//  Forum
//
//  Created by Ozan Asan on 28/02/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Message : NSObject

@property (copy) NSString *body;
@property (copy) NSString *group;
@property (copy) NSDate *date;
@property (copy) NSString *senderName;

@end

