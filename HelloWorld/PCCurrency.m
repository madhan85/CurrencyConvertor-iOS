//
//  PCCurrency.m
//  HelloWorld
//
//  Created by Cheung Ka Fai on 17/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PCCurrency.h"

@implementation PCCurrency
@synthesize currency, rate;

- (void) dealloc {
    [rate release];
    [currency release];
    [super dealloc];
}

@end
