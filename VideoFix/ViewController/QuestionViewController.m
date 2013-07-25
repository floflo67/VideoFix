//
//  QuestionViewController.m
//  VideoFix
//
//  Created by Florian Reiss on 24/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import "QuestionViewController.h"
#import "Question.h"
#import "Requests.h"

@implementation QuestionViewController

static QuestionViewController *sharedSingleton = nil;
+ (QuestionViewController*)getSingleton
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [objects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Question *question = objects[indexPath.row];
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
