//
//  Requests.m
//  VideoFix
//
//  Created by Florian Reiss on 12/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import "Requests.h"
#import "QuestionParser.h"

@implementation Requests

+ (NSArray*)getListQuestions
{
    return [[[QuestionParser alloc] init] getQuestionsFromURL:VF_API_URL];
}

+ (NSDictionary*)getListSubjects
{
    Requests *req = [[Requests alloc] init];
    return [req getListSubjects];
}

- (NSDictionary*)getListSubjects
{
    if(!_listSubjects) {
        _listSubjects = [[NSMutableDictionary alloc] init];
        NSMutableDictionary *dictMercedes = [[NSMutableDictionary alloc] init];
        [dictMercedes setValue:@"Mercedes" forKey:@"description"];
        [dictMercedes setValue:@"001" forKey:@"ID"];
        
        NSMutableDictionary *dictMicrosoft = [[NSMutableDictionary alloc] init];
        [dictMicrosoft setValue:@"Microsoft" forKey:@"description"];
        [dictMicrosoft setValue:@"011" forKey:@"ID"];
        
        NSMutableDictionary *dictFerrari = [[NSMutableDictionary alloc] init];
        [dictFerrari setValue:@"Ferrari" forKey:@"description"];
        [dictFerrari setValue:@"002" forKey:@"ID"];
        
        NSMutableDictionary *dictApple = [[NSMutableDictionary alloc] init];
        [dictApple setValue:@"Apple" forKey:@"description"];
        [dictApple setValue:@"012" forKey:@"ID"];
        
        NSArray *carBrand = [NSArray arrayWithObjects:dictMercedes, dictFerrari, nil];
        NSArray *ITBrand = [NSArray arrayWithObjects:dictMicrosoft, dictApple, nil];
        [_listSubjects setObject:carBrand forKey:@"Car"];
        [_listSubjects setObject:ITBrand forKey:@"IT"];
    }
    return _listSubjects;
}

+ (NSArray*)getListTopicsForID:(NSString*)ID
{
    Requests *req = [[Requests alloc] init];
    return [req getListTopicsForID:ID];
}

- (NSArray*)getListTopicsForID:(NSString*)ID
{
    if(!_listTopics) {
        _listTopics = [[NSMutableArray alloc] init];
        [_listTopics addObject:[NSString stringWithFormat:@"Topic 1 - %@", ID]];
        [_listTopics addObject:[NSString stringWithFormat:@"Topic 2 - %@", ID]];
        [_listTopics addObject:[NSString stringWithFormat:@"Topic 3 - %@", ID]];
        [_listTopics addObject:[NSString stringWithFormat:@"Topic 4 - %@", ID]];
    }
    return _listTopics;
}

@end
