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

-(NSString *) getCountryImage:(NSString *)name
{
    if ([name isEqualToString:@"HongKong"]) {  return @"hkd"; }
    else if ([name isEqualToString:@"USA"]) { return @"usd"; }
    else if ([name isEqualToString:@"Bulgarian"]) { return @"bgn"; }
    else if ([name isEqualToString:@"Czech"]) { return @"czk"; }
    else if ([name isEqualToString:@"Danish"]) { return @"dkk"; }
    else if ([name isEqualToString:@"United Kingdom"]) { return @"gbp"; }
    else if ([name isEqualToString:@"Hungarian"]) { return @"huf"; }
    else if ([name isEqualToString:@"Lithuanian"]) { return @"ltl"; }
    else if ([name isEqualToString:@"Latvian"]) { return @"lvl"; }
    else if ([name isEqualToString:@"Polish"]) { return @"pln"; }
    else if ([name isEqualToString:@"New Romanian"]) { return @"ron"; }
    else if ([name isEqualToString:@"Swedish"]) { return @"sek"; }
    else if ([name isEqualToString:@"Swiss"]) { return @"chf"; }
    else if ([name isEqualToString:@"Norwegian"]) { return @"nok"; }
    else if ([name isEqualToString:@"Croatian"]) { return @"hrk"; }
    else if ([name isEqualToString:@"Russian"]) { return @"rub"; }
    else if ([name isEqualToString:@"Turkish"]) { return @"try"; }
    else if ([name isEqualToString:@"Australian"]) { return @"aud"; }
    else if ([name isEqualToString:@"Brasilian"]) { return @"brl"; }
    else if ([name isEqualToString:@"Canadian"]) { return @"cad"; }
    else if ([name isEqualToString:@"Chinese"]) { return @"cny"; }
    else if ([name isEqualToString:@"Indonesian"]) { return @"idr"; }
    else if ([name isEqualToString:@"Israeli"]) { return @"ils"; }
    else if ([name isEqualToString:@"Indian"]) { return @"inr"; }
    else if ([name isEqualToString:@"South Korean"]) { return @"krw"; }
    else if ([name isEqualToString:@"Mexican"]) { return @"msn"; }
    else if ([name isEqualToString:@"Malaysian"]) { return @"myr"; }
    else if ([name isEqualToString:@"New Zealand"]) { return @"nzd"; }
    else if ([name isEqualToString:@"Philippine"]) { return @"php"; }
    else if ([name isEqualToString:@"Singapore"]) { return @"sgd"; }
    else if ([name isEqualToString:@"Thailand"]) { return @"thb"; }
    else if ([name isEqualToString:@"South African"]) { return @"zar"; }
    else if ([name isEqualToString:@"Icelandic"]) { return @"isk"; }
    else if ([name isEqualToString:@"Japan"]) { return @"jpy"; }
    else { return nil; }
}

- (NSString *) concantenateFileName:(NSString *)name {
    if (name) {
        NSString *str = [NSString stringWithFormat:@"%@.gif", name];
        return str;
    } else {
        return nil;
    }
}

@end
