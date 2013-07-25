//
//  QuestionCell.h
//  VideoFix
//
//  Created by Florian Reiss on 24/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageBackground;
@property (weak, nonatomic) IBOutlet UILabel *labelTimeFrame;
@property (weak, nonatomic) IBOutlet UILabel *labelViews;
@property (weak, nonatomic) IBOutlet UILabel *labelThanks;
@property (weak, nonatomic) IBOutlet UILabel *labelAnswers;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@end
