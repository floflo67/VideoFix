//
//  QuestionViewController.h
//  VideoFix
//
//  Created by Florian Reiss on 24/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSArray *objects;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

+(QuestionsViewController*)getSingleton;

@end
