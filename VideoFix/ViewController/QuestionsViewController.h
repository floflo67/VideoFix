//
//  QuestionViewController.h
//  VideoFix
//
//  Created by Florian Reiss on 24/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionsViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate> {
    NSArray *objects;
    NSOperationQueue *queue;
}

+(QuestionsViewController*)getSingleton;

@end
