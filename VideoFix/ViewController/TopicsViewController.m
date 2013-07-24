//
//  TopicsViewController.m
//  VideoFix
//
//  Created by Florian Reiss on 19/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import "TopicsViewController.h"
#import "Requests.h"

@interface TopicsViewController ()

@end

@implementation TopicsViewController

#pragma mark - view lifecycle

- (id)initWithID:(NSString*)ID
{
    self = [super init];
    if (self) {
        
        if(!objects)
            objects = [[NSMutableArray alloc] initWithArray:[Requests getListTopicsForID:ID]];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [objects[indexPath.row] description]];
    
    return cell;
}

@end
