//
//  PCXMLParser.h
//  HelloWorld
//
//  Created by Cheung Ka Fai on 17/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PCCurrency;

@interface PCXMLParser : NSObject <NSXMLParserDelegate>{
    // an ad hoc string to hold element value
    NSMutableString *currentElementValue;
    // user object
    PCCurrency *currency;
    // array of user objects
    NSMutableArray *currencies;
}

@property (nonatomic, retain) PCCurrency *currency;
@property (nonatomic, retain) NSMutableArray *currencies;

- (PCXMLParser *) initXMLParser;

@end
