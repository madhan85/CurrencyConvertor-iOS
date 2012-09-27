//
//  MyAppDelegate.h
//  HelloWorld
//
//  Created by Cheung Ka Fai on 24/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyAppDelegate : NSObject{
    // rootviewcontroller is the parent of your UINavigationController
    UIViewController *rootViewController;
}
+ (MyAppDelegate *)sharedAppDelegate;
-(void)passData:(NSString*)myString;

@end
