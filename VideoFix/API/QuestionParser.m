//
//  QuestionParser.m
//  VideoFix
//
//  Created by Florian Reiss on 24/07/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import "QuestionParser.h"

@implementation QuestionParser

/*
 <questions>
     <question>
        <idQuestion>7</idQuestion>
            <titleQuestion>
                <![CDATA[ How can I change the filter of my HVAC system? ]]>
            </titleQuestion>
            <thumbnailQuestion>
                <![CDATA[ http://sebastien-wickert.com/VF/thumbnails/video7.png ]]>
            </thumbnailQuestion>
            <resolvedQuestion>
                0
            </resolvedQuestion>
            <timestampQuestion>
                <![CDATA[ 2013-07-24 02:59:59 ]]>
            </timestampQuestion>
            <firstNameUserQuestion>
                <![CDATA[ Sebastien ]]>
            </firstNameUserQuestion>
            <lastNameUserQuestion>
                <![CDATA[ Wickert ]]>
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
    
}

- (void)parser:(NSXMLParser*)parser didEndElement:(NSString*)elementName namespaceURI:(NSString*)namespaceURI qualifiedName:(NSString*)qName
{
    
}

@end
