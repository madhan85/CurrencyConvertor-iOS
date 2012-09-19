//
//  PCViewController.m
//  HelloWorld
//
//  Created by Cheung Ka Fai on 20/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PCViewController.h"

@interface PCViewController ()

@end

@implementation PCViewController

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
}

- (void)viewDidUnload
{
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
@end
