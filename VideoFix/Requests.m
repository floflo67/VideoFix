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
        
        NSArray *carBrand = [NSArray arrayWithObjects:@"Mercedes", @"Ferrari", nil];
        NSArray *ITBrand = [NSArray arrayWithObjects:@"Microsoft", @"Apple", nil];
        [_listTopics setObject:carBrand forKey:@"Car"];
        [_listTopics setObject:ITBrand forKey:@"IT"];
    }
    return _listTopics;
}

@end
