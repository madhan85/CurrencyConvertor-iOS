//
//  SecondViewController.m
//  HelloWorld
//
//  Created by Cheung Ka Fai on 19/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"
#import "PCCurrency.h"
#import "PCXMLParser.h"

@interface SecondViewController ()
@end

@implementation SecondViewController
@synthesize text1;
@synthesize from;
@synthesize currencies;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self performSelectorInBackground:@selector(getCurrencyAsync) withObject:nil];
    self->currency = [[NSMutableString alloc] init];
}

- (void)viewDidUnload
{
    [self setFrom:nil];
    [self setText1:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.currencyPicker = nil;
    self.currencyPickerPopover = nil;
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
            //NSLog(@"HTML = %@", html);
            [self doParse:[html dataUsingEncoding:NSUTF8StringEncoding]];
        }
        else if ([data length] == 0 && error == nil) {
            NSLog(@"Nothing was downloaded");
        } 
        else if (error != nil) {
            NSLog(@"Error happened = %@", error);
        }
    }];
    //NSLog(@"after sendAsynchronousRequest");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"HKDollar"]) {
        ThirdViewController *ibcVC = [segue destinationViewController];
        ibcVC->btnSelected = 1;
        NSLog(@"currency = %@\n", self->currency);
        ibcVC->currency = self->currency;
    }
}

- (void)saveCurrencyValues:(NSString *)string
{
    NSMutableString *outputString = [[NSMutableString alloc] init];
    NSLog(@"str=%@", outputString);
    NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:@"<td class=\"col2\">[0-9]\{0,3}.[0-9]\{0,4}</td>" options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *array = [expression matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    for (NSTextCheckingResult *matchStr in array) {
        NSRange range = [matchStr rangeAtIndex:0];
        NSString *song = [string substringWithRange:range];
        NSArray *split = [song componentsSeparatedByString:@">"];
        NSString *str=[split objectAtIndex:1];
        split = [str componentsSeparatedByString:@"<"];
        NSString *tmp=[split objectAtIndex:0];
        //NSLog(@"str = %@", currency);

        [outputString appendFormat:@"%@\n", tmp];
    }
    //NSLog(@"outputString = %@", outputString);
    self->currency = outputString;
}

- (IBAction)FromCurrency:(id)sender {
    [from setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    [from setReturnKeyType:UIReturnKeyDone];
}

-(IBAction)textFieldReturn:(id)sender
{
    float from_rate;
    float to_rate1;
    fromCurrency = [from.text intValue];
    for (PCCurrency *ptr in currencies) {
        if ([ptr->currency isEqualToString:@"HKD"]) {
            from_rate = [ptr->rate floatValue];        }
    }
    for (PCCurrency *ptr in currencies) {
        if ([ptr->currency isEqualToString:@"USD"]) {
            to_rate1 = [ptr->rate floatValue];
        }
    }
    text1.text = [NSString stringWithFormat:@"%f", (fromCurrency*from_rate)/to_rate1];
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
        //NSLog(@"No errors - user count : %i", [parser [currencies count]]);
        // get array of users here
        currencies = [parser currencies];
        // NSLog(@"currencies=%@", [currencies count]);
//        for (PCCurrency *x in currencies) {
//            NSLog(@"currency=%@", x->currency);
//            NSLog(@"rate=%@", x->rate);
//        }
    } else {
        NSLog(@"Error parsing document!");
    }
    
    [parser release];
    [nsXmlParser release];
    
}
@end
