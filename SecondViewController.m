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
@synthesize bannerIsVisible;
@synthesize text1, text2, text3, text4, text5, text6, text0, currencies;
@synthesize btn0, btn1, btn2, btn3, btn4, btn5, btn6;
int selected = -1;

static SecondViewController *instance=nil;

+ (SecondViewController *) getInstance
{
    @synchronized(self)
    {
        if (instance == nil)
        {
            instance = [SecondViewController  new];
        }
    }
    return instance;
}

-(NSString *) getCountryImage:(NSString *)name 
{
    if ([name isEqualToString:@"HongKong"]) {  return @"hkd"; } 
    else if ([name isEqualToString:@"USA"]) { return @"usd"; } 
    else if ([name isEqualToString:@"Bulgarian"]) { return @"bgn"; } 
    else if ([name isEqualToString:@"Czech"]) { return @"czk"; } 
    else if ([name isEqualToString:@"Danish"]) { return @"dkk"; }
    else if ([name isEqualToString:@"United Kingdom"]) { return @"gbp"; }
    else if ([name isEqualToString:@"Hungarian"]) { return @"huf"; }
    else if ([name isEqualToString:@"Lithuanian"]) { return @"ltl"; }
    else if ([name isEqualToString:@"Latvian"]) { return @"lvl"; }
    else if ([name isEqualToString:@"Polish"]) { return @"pln"; }
    else if ([name isEqualToString:@"New Romanian"]) { return @"ron"; }
    else if ([name isEqualToString:@"Swedish"]) { return @"sek"; }
    else if ([name isEqualToString:@"Swiss"]) { return @"chf"; }
    else if ([name isEqualToString:@"Norwegian"]) { return @"nok"; }
    else if ([name isEqualToString:@"Croatian"]) { return @"hrk"; }
    else if ([name isEqualToString:@"Russian"]) { return @"rub"; }
    else if ([name isEqualToString:@"Turkish"]) { return @"try"; }
    else if ([name isEqualToString:@"Australian"]) { return @"aud"; } 
    else if ([name isEqualToString:@"Brasilian"]) { return @"brl"; }
    else if ([name isEqualToString:@"Canadian"]) { return @"cad"; }
    else if ([name isEqualToString:@"Chinese"]) { return @"cny"; }
    else if ([name isEqualToString:@"Indonesian"]) { return @"idr"; }
    else if ([name isEqualToString:@"Israeli"]) { return @"ils"; } 
    else if ([name isEqualToString:@"Indian"]) { return @"inr"; }
    else if ([name isEqualToString:@"South Korean"]) { return @"krw"; } 
    else if ([name isEqualToString:@"Mexican"]) { return @"msn"; }
    else if ([name isEqualToString:@"Malaysian"]) { return @"myr"; } 
    else if ([name isEqualToString:@"New Zealand"]) { return @"nzd"; }
    else if ([name isEqualToString:@"Philippine"]) { return @"php"; } 
    else if ([name isEqualToString:@"Singapore"]) { return @"sgd"; }
    else if ([name isEqualToString:@"Thailand"]) { return @"thb"; } 
    else if ([name isEqualToString:@"South African"]) { return @"zar"; }
    else if ([name isEqualToString:@"Icelandic"]) { return @"isk"; } 
    else if ([name isEqualToString:@"Japan"]) { return @"jpy"; }
    else { return nil; }
}

+ (void) hereIsSomeData:(NSString *) data
{
    SecondViewController *obj = [SecondViewController getInstance];
    obj->SelectedCurrency = data;
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
        SecondViewController *obj = [SecondViewController getInstance];
        if (obj->SelectedCurrency != nil) {
        NSString *name = [self getCountryImage:obj->SelectedCurrency];
        NSMutableString *filename = [NSMutableString stringWithCapacity:0];
        [filename appendString:name];
        [filename appendString:@".gif"];
        
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
    }
    [super viewWillAppear:animated];
    [self textFieldReturn:btn0];
}

- (void)viewWillDisappear:(BOOL)animated {
    
}

- (void)viewDidLoad
{
    adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    adView.frame = CGRectMake(0.0, 0.0, adView.frame.size.width, adView.frame.size.height);
    [adView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin];
    [self.view addSubview:adView];
    adView.delegate=self;
    self.bannerIsVisible=NO;
    
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
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    adView = nil;
    //[self setFrom:nil];
    currency = nil;
    currencies = nil;
    [self setText1:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)getCurrencyAsync {
    NSString *urlAddrsss = @"http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml";
    NSURL *url = [NSURL URLWithString:urlAddrsss];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if ([data length] > 0 && error == nil) {
            NSString *html = [[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding] autorelease];
            NSLog(@"HTML = %@", html);
            [self doParse:[html dataUsingEncoding:NSUTF8StringEncoding]];
            NSFileManager *filemgr;
            NSData *databuffer;
            NSString *datafile;
            NSString *docsDir;
            NSArray *dirPaths;
            filemgr = [NSFileManager defaultManager];
            dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            docsDir = [dirPaths objectAtIndex:0];
            datafile = [docsDir stringByAppendingPathComponent: @"datafile.dat"];
            databuffer = [html dataUsingEncoding: NSASCIIStringEncoding];
            [filemgr createFileAtPath: datafile contents: databuffer attributes:nil];
            
            databuffer = nil;
        }
        else if ([data length] == 0 && error == nil) {
            NSLog(@"Nothing was downloaded");
            [self readFileAction];
        } else if (error != nil) {
            NSLog(@"Error happened = %@", error);
            [self readFileAction];
        }
    }];
    //NSLog(@"after sendAsynchronousRequest");
    [queue release];
}

- (void) readFileAction {
    NSFileManager *filemgr;
    NSData *databuffer;
    NSString *datafile;
    NSString *docsDir;
    NSArray *dirPaths;
    filemgr = [NSFileManager defaultManager];
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    datafile = [docsDir stringByAppendingPathComponent: @"datafile.dat"];
    if ([filemgr isReadableFileAtPath:datafile] == YES) {
        databuffer = [filemgr contentsAtPath:datafile];
        [self doParse:databuffer];
    }
}

- (IBAction)FromCurrency:(id)sender {
    UITextField *field = (UITextField*)sender;
    if ([field isEqual:from]) {
        textSelected = 0;
    } else if ([field isEqual:text1]) {
        textSelected = 1;
    } else if ([field isEqual:text2]) {
        textSelected = 2;
    } else if ([field isEqual:text3]) {
        textSelected = 3;
    } else if ([field isEqual:text4]) {
        textSelected = 4;
    } else if ([field isEqual:text5]) {
        textSelected = 5;
    } else if ([field isEqual:text6]) {
        textSelected = 6;
    }
    [field setKeyboardType:UIKeyboardTypeDecimalPad];
    [field setReturnKeyType:UIReturnKeyDone];
}

-(IBAction)textFieldReturn:(id)sender
{
    float from_rate = 0;
    float to_rate1 = 0;
    float to_rate2 = 0;
    float to_rate3 = 0;
    float to_rate4 = 0;
    float to_rate5 = 0;
    float to_rate6 = 0;
    switch (textSelected) {
        case 0:
            fromCurrency = [text0.text intValue];
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency0 uppercaseString]]) {
                    from_rate = [ptr->rate floatValue];
                }
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
            if (fromCurrency > 0) {
                if (to_rate1 > 0) text1.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate1)/from_rate];
                if (to_rate2 > 0) text2.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate2)/from_rate];
                if (to_rate3 > 0) text3.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate3)/from_rate];
                if (to_rate4 > 0) text4.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate4)/from_rate];
                if (to_rate5 > 0) text5.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate5)/from_rate];
                if (to_rate6 > 0) text6.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate6)/from_rate];
            }
            break;
        case 1:
            fromCurrency = [text1.text intValue];
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency1 uppercaseString]]) {
                    from_rate = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency0 uppercaseString]]) {
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
            if (fromCurrency > 0) {
                if (to_rate1 > 0) text0.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate1)/from_rate];
                if (to_rate2 > 0) text2.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate2)/from_rate];
                if (to_rate3 > 0) text3.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate3)/from_rate];
                if (to_rate4 > 0) text4.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate4)/from_rate];
                if (to_rate5 > 0) text5.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate5)/from_rate];
                if (to_rate6 > 0) text6.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate6)/from_rate];
            }
            break;
        case 2:
            fromCurrency = [text2.text intValue];
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency2 uppercaseString]]) {
                    from_rate = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency0 uppercaseString]]) {
                    to_rate1 = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency1 uppercaseString]]) {
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
            if (fromCurrency > 0) {
                if (to_rate1 > 0) text0.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate1)/from_rate];
                if (to_rate2 > 0) text1.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate2)/from_rate];
                if (to_rate3 > 0) text3.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate3)/from_rate];
                if (to_rate4 > 0) text4.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate4)/from_rate];
                if (to_rate5 > 0) text5.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate5)/from_rate];
                if (to_rate6 > 0) text6.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate6)/from_rate];
            }
            break;
        case 3:
            fromCurrency = [text3.text intValue];
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency3 uppercaseString]]) {
                    from_rate = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency0 uppercaseString]]) {
                    to_rate1 = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency1 uppercaseString]]) {
                    to_rate2 = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency2 uppercaseString]]) {
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
            if (fromCurrency > 0) {
                if (to_rate1 > 0) text0.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate1)/from_rate];
                if (to_rate2 > 0) text1.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate2)/from_rate];
                if (to_rate3 > 0) text2.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate3)/from_rate];
                if (to_rate4 > 0) text4.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate4)/from_rate];
                if (to_rate5 > 0) text5.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate5)/from_rate];
                if (to_rate6 > 0) text6.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate6)/from_rate];
            }
            break;
        case 4:
            fromCurrency = [text4.text intValue];
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency4 uppercaseString]]) {
                    from_rate = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency0 uppercaseString]]) {
                    to_rate1 = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency1 uppercaseString]]) {
                    to_rate2 = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency2 uppercaseString]]) {
                    to_rate3 = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency3 uppercaseString]]) {
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
            if (fromCurrency > 0) {
                if (to_rate1 > 0) text0.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate1)/from_rate];
                if (to_rate2 > 0) text1.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate2)/from_rate];
                if (to_rate3 > 0) text2.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate3)/from_rate];
                if (to_rate4 > 0) text3.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate4)/from_rate];
                if (to_rate5 > 0) text5.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate5)/from_rate];
                if (to_rate6 > 0) text6.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate6)/from_rate];
            }
            break;
        case 5:
            fromCurrency = [text5.text intValue];
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency5 uppercaseString]]) {
                    from_rate = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency0 uppercaseString]]) {
                    to_rate1 = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency1 uppercaseString]]) {
                    to_rate2 = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency2 uppercaseString]]) {
                    to_rate3 = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency3 uppercaseString]]) {
                    to_rate4 = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency4 uppercaseString]]) {
                    to_rate5 = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency6 uppercaseString]]) {
                    to_rate6 = [ptr->rate floatValue];
                }
            }
            if (fromCurrency > 0) {
                if (to_rate1 > 0) text0.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate1)/from_rate];
                if (to_rate2 > 0) text1.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate2)/from_rate];
                if (to_rate3 > 0) text2.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate3)/from_rate];
                if (to_rate4 > 0) text3.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate4)/from_rate];
                if (to_rate5 > 0) text4.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate5)/from_rate];
                if (to_rate6 > 0) text6.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate6)/from_rate];
            }
            break;
        case 6:
            fromCurrency = [text6.text intValue];
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency6 uppercaseString]]) {
                    from_rate = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency0 uppercaseString]]) {
                    to_rate1 = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency1 uppercaseString]]) {
                    to_rate2 = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency2 uppercaseString]]) {
                    to_rate3 = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency3 uppercaseString]]) {
                    to_rate4 = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency4 uppercaseString]]) {
                    to_rate5 = [ptr->rate floatValue];
                }
            }
            for (PCCurrency *ptr in currencies) {
                if ([ptr->currency isEqualToString:[currency5 uppercaseString]]) {
                    to_rate6 = [ptr->rate floatValue];
                }
            }
            if (fromCurrency > 0) {
                if (to_rate1 > 0) text0.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate1)/from_rate];
                if (to_rate2 > 0) text1.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate2)/from_rate];
                if (to_rate3 > 0) text2.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate3)/from_rate];
                if (to_rate4 > 0) text3.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate4)/from_rate];
                if (to_rate5 > 0) text4.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate5)/from_rate];
                if (to_rate6 > 0) text5.text = [NSString stringWithFormat:@"%.02f", (fromCurrency*to_rate6)/from_rate];
            }
            break;
        default:
            break;
    }
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35f];
    CGRect frame = self.view.frame;
    frame.origin.y = origin_y;
    [self.view setFrame:frame];
    [UIView commitAnimations];
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
        self.currencies = [parser currencies];
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

- (IBAction)textFieldBegin:(id)sender
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35f];
    CGRect frame = self.view.frame;
    origin_y = frame.origin.y;
    frame.origin.y = -200;
    [self.view setFrame:frame];
    [UIView commitAnimations];
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
@end
