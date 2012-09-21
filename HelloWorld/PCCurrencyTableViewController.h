//
//  PCCurrencyTableViewController.h
//  HelloWorld
//
//  Created by Cheung Ka Fai on 20/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCCurrencyTableViewController : UITableViewController <UINavigationControllerDelegate> {
    NSArray *myData;
    NSString *textLabel;
    NSString *name;
}

@property (nonatomic, strong) NSString *name;

- (IBAction)pressButton1:(id)sender;
@end
