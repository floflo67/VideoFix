//
//  Question.h
//  VideoFix
//
//  Created by Florian Reiss on 24/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, strong) NSString *IDQuestion;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic) BOOL isResolved;
@property (nonatomic, strong) NSDate *timestamp;
@property (nonatomic, strong) NSString *firstNameUser;
@property (nonatomic, strong) NSString *lastNameUser;
@property (nonatomic) NSInteger numberViews;
@property (nonatomic) NSInteger numberThanks;
@property (nonatomic) NSInteger numberAnswers;

-(id)initWithDict:(NSDictionary*)dict;

@end
