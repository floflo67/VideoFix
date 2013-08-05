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
    NSURL *url = [NSURL URLWithString:path];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
    [parameters setValue:@"f9fde950aafbb8a6b32a6a0c33029870" forKey:@"token"];
    NSString* normalizedRequestParameters = [self normalizeParametersInDictionary:parameters];
    NSData* requestData = [normalizedRequestParameters dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPBody:requestData];
    NSURLResponse *response;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    if (url != nil) {
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
        parser.delegate = self;
        [parser parse];
    }
    return self.listQuestions;
}

#pragma mark - Custom function

- (NSString*)normalizeParametersInDictionary:(NSDictionary*)dict
{
    NSMutableString* normalizedRequestParameters = [NSMutableString string];
    for (NSString* key in [[dict allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)])
    {
        if ([normalizedRequestParameters length] != 0) {
            [normalizedRequestParameters appendString: @"&"];
        }
        
        [normalizedRequestParameters appendString:key];
        [normalizedRequestParameters appendString:@"="];
        if(![key isEqualToString:@"deviceId"])
            [normalizedRequestParameters appendString:[self _formEncodeString:[dict objectForKey:key]]];
        else {
            NSMutableString *deviceID = [NSString stringWithFormat:@"%@",[dict objectForKey:@"deviceId"]];
            deviceID = (NSMutableString*)[deviceID substringFromIndex:29];
            [normalizedRequestParameters appendString:deviceID];
        }
    }
    
    return normalizedRequestParameters;
}

- (NSString*)_formEncodeString:(NSString*)string
{
	NSString* encoded = (NSString*) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef) string, NULL, CFSTR("!*'();:@&=+$,/?%#[]"), kCFStringEncodingUTF8));
	return encoded;
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
