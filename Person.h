//
//  Person.h
//  DiateaCare
//
//  Created by User on 20/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, strong) NSString *firstName;

@property (nonatomic, strong) NSString *lastName;

@property (nonatomic, strong) NSString *fullName;

@property (nonatomic, strong) NSString *homeEmail;

@property (nonatomic, strong) NSString *workEmail;

@property (nonatomic,strong) NSString *phone;
@end
