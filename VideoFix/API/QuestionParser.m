//
//  QuestionParser.m
//  VideoFix
//
//  Created by Florian Reiss on 24/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import "QuestionParser.h"
#import "Question.h"

@implementation QuestionParser

- (NSArray*)getQuestionsFromURL:(NSString *)path
{
    path = @"http://sebastien-wickert.com/VF/getMostRecentQuestions.php?token=f9fde950aafbb8a6b32a6a0c33029870";
    NSURL *url = [NSURL URLWithString:path];
    //NSURL *url = [NSURL fileURLWithPath:path];
    if (url != nil) {
        NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        parser.delegate = self;
        [parser parse];
    }
    return self.listQuestions;
}

#pragma mark - NSXMLParser delegate
/*
 URL file looks like the following
    <questions>
        <question>
            <idQuestion>
                7
            </idQuestion>
            <titleQuestion>
                How can I change the filter of my HVAC system?
            </titleQuestion>
            <thumbnailQuestion>
                http://sebastien-wickert.com/VF/thumbnails/video7.png
            </thumbnailQuestion>
            <resolvedQuestion>
                0
            </resolvedQuestion>
            <timestampQuestion>
                2013-07-24 02:59:59
            </timestampQuestion>
            <firstNameUserQuestion>
                Sebastien
            </firstNameUserQuestion>
            <lastNameUserQuestion>
                Wickert
            </lastNameUserQuestion>
            <nbViewQuestion>
                0
            </nbViewQuestion>
            <nbThankQuestion>
                0
            </nbThankQuestion>
            <nbAnswerQuestion>
                0
            </nbAnswerQuestion>
        </question>
    </questions>
*/

- (void)parser:(NSXMLParser*)parser didStartElement:(NSString*)elementName namespaceURI:(NSString*)namespaceURI qualifiedName:(NSString*)qualifiedName attributes:(NSDictionary*)attributeDict
{
    if ([elementName caseInsensitiveCompare:@"questions"] == 0 || [elementName caseInsensitiveCompare:@"question"] == 0) {
    }
    else {
        self.currentStringKey = elementName;
    }
}

- (void)parser:(NSXMLParser*)parser foundCharacters:(NSString*)string
{
    if (!self.currentStringValue) {
        self.currentStringValue = [[NSMutableString alloc] initWithCapacity:50];
    }
    [self.currentStringValue appendString:string];
}

- (void)parser:(NSXMLParser*)parser foundIgnorableWhitespace:(NSString*)whitespaceString
{
    [self.currentStringValue appendString:@" "];
}

- (void)parser:(NSXMLParser*)parser didEndElement:(NSString*)elementName namespaceURI:(NSString*)namespaceURI qualifiedName:(NSString*)qName
{
    if ([elementName caseInsensitiveCompare:@"questions"] == 0) {
    }
    else if ([elementName caseInsensitiveCompare:@"question"] == 0) {
        if(!self.listQuestions)
            self.listQuestions = [[NSMutableArray alloc] init];
        [self.listQuestions addObject:[[Question alloc] initWithDict:self.dict]];
        self.dict = nil;
    }
    else {
        if(!self.dict)
            self.dict = [[NSMutableDictionary alloc] init];
        [self.dict setValue:self.currentStringValue forKey:self.currentStringKey];
        self.currentStringValue = nil;
    }
}

@end
