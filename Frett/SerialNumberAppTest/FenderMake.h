//
//  FenderMake.h
//  SerialNumberAppTest
//
//  Created by O'Shea Douglas on 31/07/2015.
//  Copyright (c) 2015 O'Shea Douglas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FenderMake : UIViewController
@property NSString* serialNumber;
@property NSString* dateRange;
@property NSString* countryOfOrigin;

//-(NSString*)retrieve:(NSString*) serial : (NSString*) gtrOrigin;
-(NSString*)retrieveAge:(NSString*) year;
-(NSString*)retrieveFenderUsa:(NSString*) serial;
-(NSString*)retrieveFenderUsaOriginalPrecisionBass:(NSString *)serial;
-(NSString*)retrieveFenderUsaBridgeSerial:(NSString *)serial;
-(NSString*)retrieveFenderUsaNeckPlateNumbersClassic:(NSString *)serial;
-(NSString*)retrieveFenderUsaLSeries:(NSString *)serial;
-(NSString*)retrieveFenderUsaFSeries:(NSString *)serial;
-(NSString*)retrieveFenderUsaPost76:(NSString *)serial;
-(NSString*)retrieveFenderUsaPost2010:(NSString *)serial;
-(NSString*)retrieveFenderMadeInJapan:(NSString*) serial;
-(NSString*)retreiveFenderCraftedInJapan:(NSString*) serial;
-(NSString*)retrieveFenderMadeInMexico:(NSString*) serial;
-(NSString*)retrieveFenderMadeInMexicoPost2010:(NSString *)serial;
-(NSString*)retrieveOrigin:(NSString*)year originNumber:(int)countryNumber;
-(NSString*)retrieveEra:(NSString*)year;
@end
