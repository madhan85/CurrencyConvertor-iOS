//
//  SecondViewController.h
//  HelloWorld
//
//  Created by Cheung Ka Fai on 19/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
@class PCXMLParser;

@interface SecondViewController : UIViewController <ADBannerViewDelegate>
{
    ADBannerView    *adView;
    BOOL bannerIsVisible;
    
    UITextField     *from;
    float           fromCurrency;
    NSMutableArray  *currencies;
    
    NSString        *SelectedCurrency;
    
    int             textSelected;
    int             origin_y;
}

@property (strong, nonatomic) NSString *SelectedCurrency;
@property (nonatomic, assign) BOOL bannerIsVisible;
@property (nonatomic, retain) NSMutableArray *currencies;
@property (nonatomic, retain) IBOutlet ADBannerView *adView;

+(SecondViewController *)getInstance;
+(void)hereIsSomeData:(NSString *) data;

- (IBAction)FromCurrency:(id)sender;
- (IBAction)textFieldEditChanged:(id)sender;
- (IBAction)textFieldReturn:(id)sender;
- (IBAction)textFieldBegin:(id)sender;

- (void) setCurrencies:(NSMutableArray *)_currencies;
@end
