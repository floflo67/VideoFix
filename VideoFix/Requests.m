//
//  Requests.m
//  VideoFix
//
//  Created by Florian Reiss on 12/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import "Requests.h"

@implementation Requests

+ (NSDictionary*)getListTopics
{
    Requests *req = [[Requests alloc] init];
    return [req getListTopics];
    
}

- (NSDictionary*)getListTopics
{
    if(!_listTopics) {
        _listTopics = [[NSMutableDictionary alloc] init];
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
        [_listTopics setObject:carBrand forKey:@"Car"];
        [_listTopics setObject:ITBrand forKey:@"IT"];
    }
    return _listTopics;
}

@end
