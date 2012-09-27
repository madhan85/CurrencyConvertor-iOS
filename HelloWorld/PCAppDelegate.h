//
//  PCAppDelegate.h
//  HelloWorld
//
//  Created by Cheung Ka Fai on 19/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCAppDelegate : UIResponder <UIApplicationDelegate> {
    UIWindow *window;
    UIViewController *rootViewController;
}

@property (strong, nonatomic) UIWindow *window;
+ (PCAppDelegate *)sharedAppDelegate;
-(void)passData:(NSString*)myString;

@end
