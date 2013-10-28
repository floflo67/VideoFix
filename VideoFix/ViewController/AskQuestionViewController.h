//
//  AskQuestionViewController.h
//  VideoFix
//
//  Created by Florian Reiss on 07/08/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AskQuestionViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info;
-(void)imagePickerControllerDidCancel:(UIImagePickerController*)picker;

@end
