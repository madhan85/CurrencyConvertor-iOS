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

@interface SecondViewController ()
-(NSString *) getCountryImage:(NSString *)name;
@end

@implementation SecondViewController
@synthesize text1, text2, text3, text4, text5, text6, from, currencies;
@synthesize btn0, btn1, btn2, btn3, btn4, btn5, btn6;
int selected = -1;
NSString *SelectedCurrency;

-(NSString *) getCountryImage:(NSString *)name 
{
    if ([name isEqualToString:@"HongKong"]) {  return @"hkd"; } 
    else if ([name isEqualToString:@"USA"]) { return @"usd"; } 
    else if ([name isEqualToString:@"Bulgarian"]) { return @"bgn"; } 
    else if ([name isEqualToString:@"Czech"]) { return @"czk"; } 
    else if ([name isEqualToString:@"Danish"]) { return @"dkk"; }
    else if ([name isEqualToString:@"United Kingdom"]) { return @"gbp"; }
    else if ([name isEqualToString:@"Hungarian"]) { return @"huf"; }
    else if ([name isEqualToString:@"Lithuanian"]) { return @"lithuanian.jpg"; }
    else if ([name isEqualToString:@"Latvian"]) { return @"latvian.jpg"; }
    else if ([name isEqualToString:@"Polish"]) { return @"polish.jpg"; }
    else if ([name isEqualToString:@"New Romanian"]) { return @"romanian.jpg"; }
    else if ([name isEqualToString:@"Swedish"]) { return @"swedish.jpg"; }
    else if ([name isEqualToString:@"Swiss"]) { return @"swiss.jpg"; }
    else if ([name isEqualToString:@"Norwegian"]) { return @"norwegian.jpg"; }
    else if ([name isEqualToString:@"Croatian"]) { return @"croatian.jpg"; }
    else if ([name isEqualToString:@"Russian"]) { return @"russian.jpg"; }
    else if ([name isEqualToString:@"Turkish"]) { return @"turkish.jpg"; }
    else if ([name isEqualToString:@"Australian"]) { return @"australian.jpg"; } 
    else if ([name isEqualToString:@"Brasilian"]) { return @"brasilian.jpg"; }
    else if ([name isEqualToString:@"Canadian"]) { return @"canadian.jpg"; }
    else if ([name isEqualToString:@"Chinese"]) { return @"cny"; }
    else if ([name isEqualToString:@"Indonesian"]) { return @"indonesian.jpg"; }
    else if ([name isEqualToString:@"Israeli"]) { return @"israeli.jpg"; } 
    else if ([name isEqualToString:@"Indian"]) { return @"indian.jpg"; }
    else if ([name isEqualToString:@"South Korean"]) { return @"krw"; } 
    else if ([name isEqualToString:@"Mexican"]) { return @"mexican.jpg"; }
    else if ([name isEqualToString:@"Malaysian"]) { return @"malaysian.jpg"; } 
    else if ([name isEqualToString:@"New Zealand"]) { return @"new-zealand.jpg"; }
    else if ([name isEqualToString:@"Philippine"]) { return @"philippine.jpg"; } 
    else if ([name isEqualToString:@"Singapore"]) { return @"singapore.jpg"; }
    else if ([name isEqualToString:@"Thailand"]) { return @"thb"; } 
    else if ([name isEqualToString:@"South African"]) { return @"south-african.jpg"; }
    else if ([name isEqualToString:@"Icelandic"]) { return @"icelandic.jpg"; } 
    else if ([name isEqualToString:@"Japan"]) { return @"jpy"; }
    else { return nil; }
}

+ (void) hereIsSomeData:(NSString *) data
{
    SelectedCurrency = data;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated 
{
    if (selected >= 0) {
        NSString *name = [self getCountryImage:SelectedCurrency];
        NSString *filename = [name stringByAppendingFormat:@".gif"];
        switch (selected) {
            case 0:
                if (name != nil) { 
                    [btn0 setBackgroundImage:[UIImage imageNamed:filename] forState:UIControlStateNormal];
                    currency0 = name;
                }
                break;
            case 1:
                if (name != nil) { 
                    [btn1 setBackgroundImage:[UIImage imageNamed:filename] forState:UIControlStateNormal];
                    currency1 = name;
                }
                break;
            case 2:
                if (name != nil) { 
                    [btn2 setBackgroundImage:[UIImage imageNamed:filename] forState:UIControlStateNormal];
                    currency2 = name;
                }
                break;
            case 3:
                if (name != nil) { 
                    [btn3 setBackgroundImage:[UIImage imageNamed:filename] forState:UIControlStateNormal];
                    currency3 = name;
                }
                break;
            case 4:
                if (name != nil) { 
                    [btn4 setBackgroundImage:[UIImage imageNamed:filename] forState:UIControlStateNormal];
                    currency4 = name;
                }
                break;
            case 5:
                if (name != nil) { 
                    [btn5 setBackgroundImage:[UIImage imageNamed:filename] forState:UIControlStateNormal];
                    currency5 = name;
                }
                break;
            case 6:
                if (name != nil) { 
                    [btn6 setBackgroundImage:[UIImage imageNamed:filename] forState:UIControlStateNormal];
                    currency6 = name;
                }
                break;
            default:
                break;
        }
    }
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self performSelectorInBackground:@selector(getCurrencyAsync) withObject:nil];
    currency0 = @"hkd";
    currency1 = @"usd";
    currency2 = @"jpy";
    currency3 = @"krw";
    currency4 = @"cny";
    currency5 = @"thb";
    currency6 = @"cny";
    self->currency = [[NSMutableString alloc] init];
}

- (void)viewDidUnload
{
    [self setFrom:nil];
    [self setText1:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)pageInfo {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Currently displaying View One" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}

- (void)getCurrencyAsync {
    NSString *urlAddrsss = @"http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml";
    NSURL *url = [NSURL URLWithString:urlAddrsss];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if ([data length] > 0 && error == nil) {
            NSString *html = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"HTML = %@", html);
            [self doParse:[html dataUsingEncoding:NSUTF8StringEncoding]];
        }
        else if ([data length] == 0 && error == nil) {
            NSLog(@"Nothing was downloaded");
        } else if (error != nil) {
            NSLog(@"Error happened = %@", error);
        }
    }];
    NSLog(@"after sendAsynchronousRequest");
}


- (IBAction)FromCurrency:(id)sender {
    [from setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    [from setReturnKeyType:UIReturnKeyDone];
}

-(IBAction)textFieldReturn:(id)sender
{
    float from_rate;
    float to_rate1;
    float to_rate2;
    float to_rate3;
    float to_rate4;
    float to_rate5;
    float to_rate6;
    fromCurrency = [from.text intValue];
    
    for (PCCurrency *ptr in currencies) {
        if ([ptr->currency isEqualToString:[currency0 uppercaseString]]) {
            from_rate = [ptr->rate floatValue];        }
    }
    for (PCCurrency *ptr in currencies) {
        if ([ptr->currency isEqualToString:[currency1 uppercaseString]]) {
            to_rate1 = [ptr->rate floatValue];
        }
    }
    for (PCCurrency *ptr in currencies) {
        if ([ptr->currency isEqualToString:[currency2 uppercaseString]]) {
            to_rate2 = [ptr->rate floatValue];
        }
    }
    for (PCCurrency *ptr in currencies) {
        if ([ptr->currency isEqualToString:[currency3 uppercaseString]]) {
            to_rate3 = [ptr->rate floatValue];
        }
    }
    for (PCCurrency *ptr in currencies) {
        if ([ptr->currency isEqualToString:[currency4 uppercaseString]]) {
            to_rate4 = [ptr->rate floatValue];
        }
    }
    for (PCCurrency *ptr in currencies) {
        if ([ptr->currency isEqualToString:[currency5 uppercaseString]]) {
            to_rate5 = [ptr->rate floatValue];
        }
    }
    for (PCCurrency *ptr in currencies) {
        if ([ptr->currency isEqualToString:[currency6 uppercaseString]]) {
            to_rate6 = [ptr->rate floatValue];
        }
    }
    text1.text = [NSString stringWithFormat:@"%f", (fromCurrency*to_rate1)/from_rate];
    text2.text = [NSString stringWithFormat:@"%f", (fromCurrency*to_rate2)/from_rate];
    text3.text = [NSString stringWithFormat:@"%f", (fromCurrency*to_rate3)/from_rate];
    text4.text = [NSString stringWithFormat:@"%f", (fromCurrency*to_rate4)/from_rate];
    text5.text = [NSString stringWithFormat:@"%f", (fromCurrency*to_rate5)/from_rate];
    text6.text = [NSString stringWithFormat:@"%f", (fromCurrency*to_rate6)/from_rate];
    [sender resignFirstResponder];
}

- (void) doParse:(NSData *)data {
    
    // create and init NSXMLParser object
    NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithData:data];
    
    // create and init our delegate
    PCXMLParser *parser = [[PCXMLParser alloc] initXMLParser];
    
    // set delegate
    [nsXmlParser setDelegate:parser];
    
    // parsing...
    BOOL success = [nsXmlParser parse];
    
    // test the result
    if (success) {
        currencies = [parser currencies];
    } else {
        NSLog(@"Error parsing document!");
    }
    
    [parser release];
    [nsXmlParser release];
}

#pragma mark -
#pragma mark Actions

- (IBAction)textLabel:(id)sender {
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIButton *btn = (UIButton *)sender;
        
    if ([ btn isEqual:btn0]) {
        selected = 0;
    }
    if ([ btn isEqual:btn1]) {
        selected = 1;
    }
    if ([ btn isEqual:btn2]) {
        selected = 2;
    }
    if ([ btn isEqual:btn3]) {
        selected = 3;
    }
    if ([ btn isEqual:btn4]) {
        selected = 4;
    }
    if ([ btn isEqual:btn5]) {
        selected = 5;
    }
    if ([ btn isEqual:btn6]) {
        selected = 6;
    }
}
@end
