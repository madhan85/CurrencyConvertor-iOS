//
//  CurrencyURLParser.h
//  HelloWorld
//
//  Created by Patrick Cheung on 8/11/13.
//
//

#import <Foundation/Foundation.h>

@interface CurrencyURLParser : NSObject
{
    BOOL            parseFinished;
    NSMutableArray  *currencies;    
}

@property (nonatomic, getter = IsParseFinsihed) BOOL parseFinished;
@property (strong, retain) NSMutableArray * currencies;

- (instancetype) selfInit;
-(NSMutableArray *) urlParsed;

@end