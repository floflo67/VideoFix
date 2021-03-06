//
//  AppDelegate.m
//  VideoFix
//
//  Created by Florian Reiss on 12/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import "AppDelegate.h"
#import "CenterViewController.h"
#import "SideMenuViewController.h"
#import "MFSideMenuContainerViewController.h"

@implementation AppDelegate

- (CenterViewController*)viewController
{
    if(!_viewController)
        _viewController = [[CenterViewController alloc] initWithNibName:@"CenterViewController" bundle:nil];
    return _viewController;
}

- (UINavigationController *)navigationController
{
    return [[UINavigationController alloc] initWithRootViewController:self.viewController];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    SideMenuViewController *leftMenuViewController = [[SideMenuViewController alloc] init];
    MFSideMenuContainerViewController *container = [MFSideMenuContainerViewController
                                                    containerWithCenterViewController:[self navigationController]
                                                    leftMenuViewController:leftMenuViewController
                                                    rightMenuViewController:nil];
    self.window.rootViewController = container;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
