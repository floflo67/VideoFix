//
//  QuestionParser.h
//  VideoFix
//
//  Created by Florian Reiss on 24/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionParser : NSObject <NSXMLParserDelegate>

@property (nonatomic, strong) NSDictionary *dict;
@property (nonatomic, strong) NSMutableString *currentStringValue;
@property (nonatomic, strong) NSString *currentStringKey;
@property (nonatomic, strong) NSMutableArray *listQuestions;


-(NSArray*)getQuestionsFromURL:(NSString *)path;

@end
