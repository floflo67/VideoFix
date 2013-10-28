//
//  AskQuestionViewController.m
//  VideoFix
//
//  Created by Florian Reiss on 07/08/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import <MobileCoreServices/MobileCoreServices.h>
#import "AskQuestionViewController.h"
#import "AppDelegate.h"

@interface AskQuestionViewController ()

@end

@implementation AskQuestionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Ask Question";
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.view.frame = CGRectMake(0, 0, 320, 300);
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.videoQuality = UIImagePickerControllerQualityTypeMedium;
    picker.videoMaximumDuration = 20;
    picker.mediaTypes = @[(NSString*)kUTTypeMovie, (NSString*)kUTTypeImage];
    picker.view.backgroundColor = [UIColor clearColor];
    picker.delegate = self;
    [self.view addSubview:picker.view];
    [picker viewWillAppear:YES];
    [picker viewDidAppear:YES];
}

#pragma mark - ImagePicker delegate

- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    [picker.view removeFromSuperview];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController*)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    [picker.view removeFromSuperview];
}

@end
