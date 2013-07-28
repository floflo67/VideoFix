//
//  QuestionCell.m
//  VideoFix
//
//  Created by Florian Reiss on 24/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import "QuestionCell.h"

@implementation QuestionCell

- (void)loadBackground:(NSString*)imagePath
{
	NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:imagePath]];
	[self performSelectorOnMainThread:@selector(assignImageToBackground:) withObject:imageData waitUntilDone:NO];
}

- (void)assignImageToBackground:(NSData*)imageData
{
	self.imageBackground.image = [UIImage imageWithData:imageData];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
}

@end
