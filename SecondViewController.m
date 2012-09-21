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
@end

@implementation SecondViewController
@synthesize text1, from, currencies;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
        // Custom initialization
    }
    return self;
}

- (void)viewWillDisappear:(BOOL)animated {
    
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
    PCCurrencyTableViewController *controller = segue.destinationViewController;
    
    UIButton *btn = (UIButton *)sender;
    
    NSLog(@"%@", [sender currentTitle]);
    
//    if ( [btn.accessibilityLabel isEqualToString:@"FromCurreny"]) {
//        controller.name = @"from";
//    }
}
@end
