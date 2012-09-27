    //
//  MyAppDelegate.m
//  HelloWorld
//
//  Created by Cheung Ka Fai on 24/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyAppDelegate.h"
#import "SecondViewController.h"

@implementation MyAppDelegate

+ (MyAppDelegate *)sharedAppDelegate
{
    return (MyAppDelegate *) [UIApplication sharedApplication].delegate;
}

-(void)passData:(NSString*)myString
{
    
    // pass data to parent of UINavigationController
    [SecondViewController hereIsSomeData:myString];
    
}
@end
