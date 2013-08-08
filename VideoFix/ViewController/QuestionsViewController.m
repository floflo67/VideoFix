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

@interface QuestionsViewController()
@property (nonatomic, strong) NSMutableArray *cells;
@property (nonatomic, strong) NSArray *objects;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@end


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
    self.objects = [Requests getListQuestions];
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
    return [self.objects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"QuestionCell";
    if(!queue)
        queue = [NSOperationQueue new];
    
    QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"QuestionCell" owner:self options:nil];
        cell = topLevelObjects[0];
    }
    
    @try {
        cell = [self.cells objectAtIndex:indexPath.row];
    }
    @catch (NSException * e) {
        
        Question *question = self.objects[indexPath.row];
        cell.labelAnswers.text = [NSString stringWithFormat:@"%i Answers", question.numberAnswers];
        cell.labelThanks.text = [NSString stringWithFormat:@"%i Thanks", question.numberThanks];
        cell.labelViews.text = [NSString stringWithFormat:@"%i Views", question.numberViews];
        cell.labelTitle.text = question.title;
        
        NSInteger timeInterval = [[NSDate new] timeIntervalSinceDate:question.timestamp] / 60;
        NSString *timeFormat = @"minutes";
        
        if(timeInterval > 60) {
            timeInterval /= 60;
            timeFormat = @"hours";
            if(timeInterval > 24) {
                timeInterval /= 24;
                timeFormat = @"days";
            }
        }
        
        cell.labelTimeFrame.text = [NSString stringWithFormat:@"Asked %i %@ ago by %@", timeInterval, timeFormat, question.firstNameUser];
        NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:cell selector:@selector(loadBackground:) object:question.thumbnail];
        [queue addOperation:operation];
        [self.cells insertObject:cell atIndex:indexPath.row];
        
    }
    /*@finally {
        //something that you want to do wether the exception is thrown or not.
    }
    
    if(![self.cells objectAtIndex:indexPath.row]) {
        Question *question = self.objects[indexPath.row];
        cell.labelAnswers.text = [NSString stringWithFormat:@"%i Answers", question.numberAnswers];
        cell.labelThanks.text = [NSString stringWithFormat:@"%i Thanks", question.numberThanks];
        cell.labelViews.text = [NSString stringWithFormat:@"%i Views", question.numberViews];
        cell.labelTitle.text = question.title;
        
        NSInteger timeInterval = [[NSDate new] timeIntervalSinceDate:question.timestamp] / 60;
        NSString *timeFormat = @"minutes";
        
        if(timeInterval > 60) {
            timeInterval /= 60;
            timeFormat = @"hours";
            if(timeInterval > 24) {
                timeInterval /= 24;
                timeFormat = @"days";
            }
        }
        
        cell.labelTimeFrame.text = [NSString stringWithFormat:@"Asked %i %@ ago by %@", timeInterval, timeFormat, question.firstNameUser];
        NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:cell selector:@selector(loadBackground:) object:question.thumbnail];
        [queue addOperation:operation];
        [self.cells insertObject:cell atIndex:indexPath.row];
    }
    else
        cell = [self.cells objectAtIndex:indexPath.row];*/
    return cell;
}

#pragma mark - Button events

- (IBAction)askquestionButton:(UIButton *)sender
{
    
}


#pragma mark - UITableViewDelegate

/*
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 TopicsViewController *detailController = [[TopicsViewController alloc] initWithID:[([objects allValues][indexPath.section])[indexPath.row] objectForKey:@"ID"]];
 detailController.title = [NSString stringWithFormat:@"Topic %@", [([objects allValues][indexPath.section])[indexPath.row] objectForKey:@"description"]];
 [self.navigationController pushViewController:detailController animated:YES];
 }*/

#pragma mark - getter and setter

- (NSMutableArray*)cells
{
    if(!_cells)
        _cells = [[NSMutableArray alloc] initWithCapacity:[self.objects count]];
    return _cells;    
}

- (NSArray *)objects
{
    if(!_objects)
        _objects = [[NSArray alloc] init];
    return _objects;
}

@end
