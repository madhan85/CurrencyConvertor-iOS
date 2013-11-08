//
//  CurrencyURLParser.m
//  HelloWorld
//
//  Created by Patrick Cheung on 8/11/13.
//
//

#import "SecondViewController.h"
#import "CurrencyURLParser.h"
#import "PCXMLParser.h"

@implementation CurrencyURLParser

@synthesize currencies;
@synthesize parseFinished;

- (instancetype) selfInit {
    self = [super init];
    if (self) {
        parseFinished = NO;
        currencies = [[NSMutableArray alloc] init];
        [self performSelectorInBackground:@selector(getCurrencyAsync) withObject:nil];
    }
    return self;
}

-(NSMutableArray *) urlParsed {
    return parseFinished ? self->currencies : nil;
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
        NSMutableArray *array = [parser currencies];
        for (PCCurrency *ptr in array) {
            [self->currencies addObject:ptr];
        }
        parseFinished = YES;
    } else {
        NSLog(@"Error parsing document!");
    }
    
    [parser release];
    [nsXmlParser release];
}

- (BOOL) IsParseFinsihed {
    return parseFinished;
}

@end

