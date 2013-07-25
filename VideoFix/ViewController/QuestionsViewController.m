//
//  QuestionViewController.m
//  VideoFix
//
//  Created by Florian Reiss on 24/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import "QuestionsViewController.h"
#import "Question.h"
#import "Requests.h"
#import "QuestionCell.h"

@implementation QuestionsViewController

static QuestionsViewController *sharedSingleton = nil;
+ (QuestionsViewController*)getSingleton
{
    if (sharedSingleton != nil)
        return sharedSingleton;
    @synchronized(self)
    {
        if (sharedSingleton == nil)
            sharedSingleton = [[self alloc] init];
    }
    return sharedSingleton;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(!objects)
        objects = [[NSArray alloc] initWithArray:[Requests getListQuestions]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [objects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"QuestionCell";    
    QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"QuestionCell" owner:self options:nil];
        cell = topLevelObjects[0];
    }
    Question *question = objects[indexPath.row];
    cell.labelAnswers.text = [NSString stringWithFormat:@"%i Answers", question.numberAnswers];
    cell.labelThanks.text = [NSString stringWithFormat:@"%i Thanks", question.numberThanks];
    cell.labelViews.text = [NSString stringWithFormat:@"%i Views", question.numberViews];
    cell.labelTitle.text = question.title;
    
    NSDate* date = [NSDate new];
    NSTimeInterval distanceBetweenDates = [date timeIntervalSinceDate:question.timestamp];
    NSInteger minutesBetweenDates = distanceBetweenDates / 60;
    
    cell.labelTimeFrame = [NSString stringWithFormat:@"Asked %i minutes ago by %@", minutesBetweenDates, question.firstNameUser];
    
    UIImage *img = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:question.thumbnail]]];
    cell.imageBackground.image = img;
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", question.title];
    
    return cell;
}

#pragma mark - UITableViewDelegate

/*
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 TopicsViewController *detailController = [[TopicsViewController alloc] initWithID:[([objects allValues][indexPath.section])[indexPath.row] objectForKey:@"ID"]];
 detailController.title = [NSString stringWithFormat:@"Topic %@", [([objects allValues][indexPath.section])[indexPath.row] objectForKey:@"description"]];
 [self.navigationController pushViewController:detailController animated:YES];
 }*/

@end
