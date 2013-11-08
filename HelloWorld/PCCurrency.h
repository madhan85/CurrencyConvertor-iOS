//
//  PCCurrency.h
//  HelloWorld
//
//  Created by Cheung Ka Fai on 17/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCCurrency : NSObject {
@public
    NSString *currency;
    NSString *rate;
}

@property (nonatomic, retain) NSString *currency;
@property (nonatomic, retain) NSString *rate;

-(NSString *) getCountryImage:(NSString *)name;
-(NSString *) concantenateFileName:(NSString *)name;

@end
