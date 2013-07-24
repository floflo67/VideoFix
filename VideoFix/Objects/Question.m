//
//  Question.m
//  VideoFix
//
//  Created by Florian Reiss on 24/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import "Question.h"

@implementation Question
@synthesize IDQuestion, title, thumbnail, isResolved, timestamp, firstNameUser, lastNameUser, numberAnswers, numberThanks, numberViews;

- (id)initWithDict:(NSDictionary*)dict
{
    self = [super init];
    if(self) {
        self.IDQuestion = [dict objectForKey:@"idQuestion"];
        title = [dict objectForKey:@"titleQuestion"];
        thumbnail = [dict objectForKey:@"thumbnailQuestion"];
        isResolved = [[dict objectForKey:@"resolvedQuestion"] boolValue];
        timestamp = [dict objectForKey:@"timestampQuestion"];
        firstNameUser = [dict objectForKey:@"firstNameUserQuestion"];
        lastNameUser = [dict objectForKey:@"lastNameUserQuestion"];
        numberAnswers = [[dict objectForKey:@"nbAnswerQuestion"] integerValue];
        numberThanks = [[dict objectForKey:@"nbThankQuestion"] integerValue];
        numberViews = [[dict objectForKey:@"nbViewQuestion"] integerValue];
    }
    return self;
}

@end
