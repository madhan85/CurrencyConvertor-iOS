//
//  PCCurrecnyPickerController.h
//  HelloWorld
//
//  Created by Cheung Ka Fai on 18/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CurrencyPickerDelegate
- (void)currencySelected:(NSString *)currencies;
@end


@interface PCCurrencyPickerController : UITableViewController {
    NSMutableArray *_currencies;
    id<CurrencyPickerDelegate> _delegate;
}

@property (nonatomic, retain) NSMutableArray *currencies;
@property (nonatomic, assign) id<CurrencyPickerDelegate> delegate;

@end
