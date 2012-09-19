//
//  ThirdViewController.h
//  HelloWorld
//
//  Created by Cheung Ka Fai on 20/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> {

    IBOutlet UIPickerView *picker1;
    NSArray            *countryNames;
    NSMutableArray     *exchangeRates;
    UILabel            *resultLabel;
    UITextField        *dollarText;
@public
    int                 btnSelected;
    NSMutableString     *currency;
}
@property (strong, nonatomic) IBOutlet UIPickerView *picker1;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutlet UITextField *dollarText;
@property (strong, nonatomic) NSArray *countryNames;
@property (strong, nonatomic) NSArray *exchangeRates;
-(IBAction)textFieldReturn :(id)sender;

@end
