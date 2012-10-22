    //
//  PCXMLParser.m
//  HelloWorld
//
//  Created by Cheung Ka Fai on 17/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PCXMLParser.h"

@implementation PCXMLParser
@synthesize currency, currencies;

- (PCXMLParser *) initXMLParser {
    self = [super init];
    if (!self) {
        return nil;
    }
    // init array of user objects
    if (self) {
        currencies = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) dealloc {
    [currencies release];
    [currency release];
    [super dealloc];
}

- (void)parser:(NSXMLParser *)parser 
didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qualifiedName 
    attributes:(NSDictionary *)attributeDict {
    
    if ([elementName isEqualToString:@"Cube"]) {
        currency = [[PCCurrency alloc] init];
        //We do not have any attributes in the user elements, but if
        // you do, you can extract them here:
        currency.currency = [attributeDict objectForKey:@"currency"];
        currency.rate = [attributeDict objectForKey:@"rate"];
    } 
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!currentElementValue) {
        // init the ad hoc string with the value
        if (![string isEqualToString:@"\n"]) {
            currentElementValue = [[NSMutableString alloc] initWithString:string];
        }
    } else {
        // append value to the ad hoc string
        if (![string isEqualToString:@"\n"]) {
            [currentElementValue appendString:string];
        }
    }
}  

- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"gesmes:Envelope"]) {
        // We reached the end of the XML document
        return;
    }
    
    if ([elementName isEqualToString:@"Cube"]) {
        // We are done with user entry – add the parsed user 
        // object to our user array
        if (currency != nil) {
            [currencies addObject:currency];
            // release user object
            [currency release];
            currency = nil;
        }
    } else {
        // The parser hit one of the element values. 
        // This syntax is possible because User object 
        // property names match the XML user element names   
        //[currency setValue:currentElementValue forKey:elementName];
    }
    
    [currentElementValue release];
    currentElementValue = nil;
}

@end
