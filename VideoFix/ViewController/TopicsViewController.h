//
//  TopicsViewController.h
//  VideoFix
//
//  Created by Florian Reiss on 19/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *objects;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

-(id)initWithID:(NSString*)ID;

@end
