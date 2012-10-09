//
//  ThirdViewController.m
//  HelloWorld
//
//  Created by Cheung Ka Fai on 20/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController
@synthesize picker1;
@synthesize dollarText;
@synthesize exchangeRates;
@synthesize countryNames;
@synthesize resultLabel;

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
    self.countryNames = [[NSArray alloc] initWithObjects:
                         @"Australia (AUD)", @"China (CNY)", @"France (EUR)",
                         @"Great Britain (GBP)", @"Japan (JPY)", nil];
    
    self.exchangeRates = [[NSMutableArray alloc] initWithCapacity:5];
        
 /*   
    [exchangeRates addObject: [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.9922],
                                      [NSNumber numberWithFloat:6.5938], 
                                      [NSNumber numberWithFloat:0.7270],
                                      [NSNumber numberWithFloat:0.6206], 
                                      [NSNumber numberWithFloat:81.57],nil]];
  */ 
    NSArray *ptr = [[self->currency componentsSeparatedByString:@"\n"] autorelease];
    for (int i = 0; i < [ptr count]; i++) {
        float my_float = [[ptr objectAtIndex:i] floatValue];
        NSNumber *num = [NSNumber numberWithFloat:my_float];
        [exchangeRates addObject:num];
    }
    for (int i = 0; i < [exchangeRates count]; i++) {
        NSLog(@"rate is %@\n", [exchangeRates objectAtIndex:i]);
    }
    //[ptr release];
}

- (void)viewDidUnload
{
    [self setPicker1:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view. 
    self.resultLabel = nil;
    self.dollarText = nil;
    self.picker1 = nil;
    self.exchangeRates = nil;
    
}

- (void) dealloc
{
    [self.exchangeRates release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [countryNames count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [countryNames objectAtIndex:row];
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    float rate = [[[exchangeRates objectAtIndex:0] objectAtIndex:row ] floatValue];
    float dollars = [dollarText.text floatValue];
    float result = dollars * rate;
    NSString *resultString = nil;
    if (btnSelected == 1) {
        resultString = [[NSString alloc] initWithFormat:
                            @"%.2f USD = %.2f %@", dollars, result,
                            [countryNames objectAtIndex:row]];
        NSLog(@"currency = %@\n", currency);
    }
    resultLabel.text = resultString;
    [resultString release];
}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}
@end
