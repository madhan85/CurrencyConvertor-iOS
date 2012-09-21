//
//  SecondViewController.h
//  HelloWorld
//
//  Created by Cheung Ka Fai on 19/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PCXMLParser;

@interface SecondViewController : UIViewController{
    NSMutableString *currency;
    UITextField    *from;
    int             fromCurrency;
    NSMutableArray *currencies;
}

@property (strong, nonatomic) IBOutlet UITextField *text1;
@property (strong, nonatomic) IBOutlet UITextField *from;
@property (nonatomic, retain) NSMutableArray *currencies;

-(IBAction)pageInfo;
-(void)getCurrencyAsync;
+(void)sendAsynchronousREquest:(NSURLRequest *)request queue:(NSOperationQueue *)queue completeHandler:(void(^)(NSURLRequest*, NSData *, NSError *)) handler;
- (IBAction)FromCurrency:(id)sender;
- (IBAction)textFieldReturn:(id)sender;
- (IBAction)buttonPressed:(id)sender;
@end
