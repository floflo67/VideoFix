//
//  CenterViewController.m
//  VideoFix
//
//  Created by Florian Reiss on 12/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import "CenterViewController.h"
#import "MFSideMenuContainerViewController.h"
#import "TopicsViewController.h"
#import "QuestionsViewController.h"

@implementation CenterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupMenuBarButtonItems];
    [self loadQuestionsView];
}

- (MFSideMenuContainerViewController *)menuContainerViewController
{
    return (MFSideMenuContainerViewController *)self.navigationController.parentViewController;
}

#pragma mark - CenterViewController

- (void)loadQuestionsView
{
    [self.viewContent addSubview:[QuestionsViewController getSingleton].view];
    self.title = @"Questions";
}

#pragma mark - UIBarButtonItems

- (void)setupMenuBarButtonItems
{
    if(self.menuContainerViewController.menuState == MFSideMenuStateClosed && ![[self.navigationController.viewControllers objectAtIndex:0] isEqual:self]) {
        self.navigationItem.leftBarButtonItem = [self backBarButtonItem];
    }
    else {
        self.navigationItem.leftBarButtonItem = [self leftMenuBarButtonItem];
    }
}

- (UIBarButtonItem *)leftMenuBarButtonItem
{
    return [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(leftSideMenuButtonPressed:)];
}

- (UIBarButtonItem *)backBarButtonItem
{
    return [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back-arrow"] style:UIBarButtonItemStyleBordered target:self action:@selector(backButtonPressed:)];
}

#pragma mark - UIBarButtonItem Callbacks

- (void)backButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)leftSideMenuButtonPressed:(id)sender
{
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
        [self setupMenuBarButtonItems];
    }];
}

@end
