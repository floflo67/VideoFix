//
//  Question.m
//  VideoFix
//
//  Created by Florian Reiss on 24/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import "Question.h"

@implementation Question

- (id)initWithDict:(NSDictionary*)dict
{
    self = [super init];
    if(self) {
        self.IDQuestion = [dict objectForKey:@"idQuestion"];
        self.title = [dict objectForKey:@"titleQuestion"];
        self.thumbnail = [dict objectForKey:@"thumbnailQuestion"];
        self.isResolved = [[dict objectForKey:@"resolvedQuestion"] boolValue];
        self.firstNameUser = [dict objectForKey:@"firstNameUserQuestion"];
        self.lastNameUser = [dict objectForKey:@"lastNameUserQuestion"];
        self.numberAnswers = [[dict objectForKey:@"nbAnswerQuestion"] integerValue];
        self.numberThanks = [[dict objectForKey:@"nbThankQuestion"] integerValue];
        self.numberViews = [[dict objectForKey:@"nbViewQuestion"] integerValue];
        
        NSString *date  = [dict objectForKey:@"timestampQuestion"];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
        self.timestamp = [dateFormat dateFromString:date];
        NSLog(@"date: %@, timestamp: %@", date, self.timestamp);
    }
    return self;
}

- (UIImage*)imageThumbnail
{
    if(!_imageThumbnail) {
        _imageThumbnail = [self imageWithImage:[[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.thumbnail]]] scaledToSize:CGSizeMake(320, 80)];
    }
    return _imageThumbnail;
}

- (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
