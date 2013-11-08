//
//  SecondViewController.m
//  HelloWorld
//
//  Created by Cheung Ka Fai on 19/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PCAppDelegate.h"
#import "SecondViewController.h"
#import "PCCurrency.h"
#import "PCXMLParser.h"
#import "PCCurrencyTableViewController.h"
#import "CurrencyURLParser.h"

@interface SecondViewController ()
@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *currencyButtns;
@property (retain, nonatomic) IBOutletCollection(UITextField) NSArray *currencyTextFields;
@property (strong, nonatomic) NSMutableArray *currencyTexts;
@property (strong, nonatomic) CurrencyURLParser *parser;
@end

@implementation SecondViewController
@synthesize  adView, bannerIsVisible;
@synthesize SelectedCurrency;
@synthesize currencies;
int selected = -1;

static SecondViewController *instance=nil;

-(NSMutableArray *) currencyTexts {
    if (!_currencyTexts) {
        _currencyTexts = [[NSMutableArray alloc] initWithObjects:
                              @"hkd", @"usd", @"jpy", @"krw", @"cny", @"thb", @"cad", nil];

    }
    return _currencyTexts;
}

+ (SecondViewController *) getInstance
{
    @synchronized(self)
    {
        if (instance == nil) instance = [SecondViewController  new];
    }
    return instance;
}

+ (void) hereIsSomeData:(NSString *) data
{
    SecondViewController *controller = [SecondViewController getInstance];
    controller.SelectedCurrency = data;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
        // Custom initialization
    }
    return self;
}

- (NSString *) SelectedCurrency {
    if (!SelectedCurrency) SelectedCurrency = @"HongKong";
    return SelectedCurrency;
}

- (void)viewWillAppear:(BOOL)animated
{
    if (selected >= 0) {
        SecondViewController *controller = [SecondViewController getInstance];
        NSString *data = controller.SelectedCurrency;
        if (data != nil) {
            PCCurrency *ptr = [[PCCurrency alloc] init];
            NSString *name = [ptr getCountryImage:data];
            NSString *filename = [ptr concantenateFileName:name];
            UIButton *btn = [self.currencyButtns objectAtIndex:selected];
            if (btn) {
                [btn setBackgroundImage:[UIImage imageNamed:filename] forState:UIControlStateNormal];
                self.currencyTexts[selected] = name;
            }
            [ptr release];
        }
    }
    self.navigationItem.hidesBackButton = YES;
    [super viewWillAppear:animated];
    [self textFieldReturn:[self.currencyButtns firstObject]];
}

- (void)viewWillDisappear:(BOOL)animated {
    
}

- (void)viewDidLoad
{
	// Do any additional setup after loading the view.
    self.parser = [[CurrencyURLParser alloc] selfInit];
    [super viewDidLoad];
    adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    adView.frame = CGRectMake(0.0, 0.0, adView.frame.size.width, adView.frame.size.height);
    [adView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin];
    [self.view addSubview:adView];
    [adView setDelegate:self];
    self.bannerIsVisible = NO;
}

- (void)viewDidUnload
{
    adView = nil;
    currencies = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)FromCurrency:(id)sender {
    UITextField*  textField = (UITextField* )sender;
    
    for (UITextField * field in self.currencyTextFields) {
        if ([sender isKindOfClass:[UITextField class]]) {
            if (field == (UITextField *) sender) {
                textSelected = [self.currencyTextFields indexOfObject:(UITextField *)sender];
            }
        }
    }
    
    [textField setKeyboardType:UIKeyboardTypeDecimalPad];
    [textField setReturnKeyType:UIReturnKeyDone];
}

-(NSNumber *) getRateFromCurrencyIndex:(int)index
{
    NSNumber *rate = nil;
    BOOL found = NO;
    
    for (PCCurrency *ptr in self.currencies) {
        if ([ptr->currency isEqualToString:[self.currencyTexts[index] uppercaseString]]) {
            rate = [[[NSNumber alloc] initWithFloat:[ptr->rate floatValue]] autorelease];
            found = YES;
            break;
        }
    }
    if (!found) {
        rate = [[[NSNumber alloc] initWithFloat:0] autorelease];
    }
    
    return rate;
}

-(IBAction)textFieldReturn:(id)sender
{
    float from_rate = 0;

    if ([self.parser IsParseFinsihed]) {
        if (!self.currencies) {
            self.currencies = [[NSMutableArray alloc] init];
            NSMutableArray *array = [self.parser urlParsed];
            for (PCCurrency *ptr in array) {
                [currencies addObject:ptr];
            }
        }
    }
    
    NSMutableArray *rateArray = [[[NSMutableArray alloc]
                                  initWithObjects: @[], @[], @[], @[], @[], @[], @[],nil] autorelease];
    
    for (UITextField *field in self.currencyTextFields) {
        if ([field isEditing]) {
            fromCurrency = [field.text floatValue];
            break;
        }
    }
    for (int i = 0; i < [rateArray count]; i++) {
        NSNumber *number = [self getRateFromCurrencyIndex:i];
        if (number) {
            [rateArray replaceObjectAtIndex:i withObject:number];
        }
    }
    
    from_rate = [[rateArray objectAtIndex:textSelected] floatValue];
    if (fromCurrency > 0 && from_rate > 0) {
        for (int i = 0; i < [self.currencyTextFields count]; i++) {
            if (i != textSelected) {
                UITextField *textField = [self.currencyTextFields objectAtIndex:i];
                float rate = [[rateArray objectAtIndex:i] floatValue];
                if (rate > 0)
                    textField.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*rate)/from_rate];
            }
        }
    }
    [self animateTextField:(UITextField *)sender up:YES];
    //[sender resignFirstResponder];
}

#pragma mark -
#pragma mark Actions

- (void) animateTextField:(UITextField*)textField up:(BOOL)up {
    int txtPosition = (textField.frame.origin.y - 140);
    const int movementDistance = (txtPosition < 0 ? 0 : txtPosition); // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (IBAction)textFieldBegin:(id)sender
{
    [self animateTextField:(UITextField *)sender up:YES];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    for (UIButton *button in self.currencyButtns) {
        if ([sender isKindOfClass:[UIButton class]]) {
            if ((UIButton *)sender == button) {
                selected = [self.currencyButtns indexOfObject:button];
            }
        }
    }
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // banner is invisible now and moved out of the screen on 50 px
        adView.frame = CGRectMake(0.0, 0.0, adView.frame.size.width, adView.frame.size.height);
        [UIView commitAnimations];
        self.bannerIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // banner is visible and we move it out of the screen, due to connection issue
        adView.frame = CGRectMake(0.0, 0.0, adView.frame.size.width, adView.frame.size.height);
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
    }
}

- (IBAction)textFieldEditChanged:(id)sender
{
    [self textFieldReturn:sender];
}

- (void)dealloc {
    [_currencyTexts release];
    [_currencyButtns release];
    [_currencyTextFields release];
    [super dealloc];
}
@end
