//
//  Requests.h
//  VideoFix
//
//  Created by Florian Reiss on 12/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Requests : NSObject

@property (nonatomic, strong) NSMutableDictionary *listSubjects;
@property (nonatomic, strong) NSMutableArray *listTopics;

+(NSDictionary*)getListSubjects;
+(NSArray*)getListTopicsForID:(NSString*)ID;

@end
