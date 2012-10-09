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
    
    NSMutableString *currency;
    UITextField     *from;
    int             fromCurrency;
    NSMutableArray  *currencies;
    UIButton        *btn0;
    UIButton        *btn1;
    UIButton        *btn2;
    UIButton        *btn3;
    UIButton        *btn4;
    UIButton        *btn5;
    UIButton        *btn6;
    NSString        *currency0;
    NSString        *currency1;
    NSString        *currency2;
    NSString        *currency3;
    NSString        *currency4;
    NSString        *currency5;
    NSString        *currency6;
    
    NSString        *SelectedCurrency;
    int             textSelected;
    int             origin_y;
}

@property (nonatomic,assign) BOOL bannerIsVisible;

@property (strong, nonatomic) IBOutlet UITextField *text1;
@property (strong, nonatomic) IBOutlet UITextField *text2;
@property (strong, nonatomic) IBOutlet UITextField *text3;
@property (strong, nonatomic) IBOutlet UITextField *text4;
@property (strong, nonatomic) IBOutlet UITextField *text5;
@property (strong, nonatomic) IBOutlet UITextField *text6;
@property (strong, nonatomic) IBOutlet UITextField *text0;
@property (nonatomic, retain) NSMutableArray *currencies;
@property (strong, nonatomic) IBOutlet UIButton *btn0;
@property (strong, nonatomic) IBOutlet UIButton *btn1;
@property (strong, nonatomic) IBOutlet UIButton *btn2;
@property (strong, nonatomic) IBOutlet UIButton *btn3;
@property (strong, nonatomic) IBOutlet UIButton *btn4;
@property (strong, nonatomic) IBOutlet UIButton *btn5;
@property (strong, nonatomic) IBOutlet UIButton *btn6;

+(SecondViewController *)getInstance;
-(void)viewWillAppear:(BOOL)animated;
-(NSString *)getCountryImage:(NSString *)name;
-(void)getCurrencyAsync;
+(void)hereIsSomeData:(NSString *) data;
+(void)sendAsynchronousREquest:(NSURLRequest *)request queue:(NSOperationQueue *)queue completeHandler:(void(^)(NSURLRequest*, NSData *, NSError *)) handler;
- (IBAction)FromCurrency:(id)sender;
- (IBAction)textFieldReturn:(id)sender;
- (IBAction)buttonPressed:(id)sender;
- (IBAction)textFieldBegin:(id)sender;
- (void) readFileAction;

@end
