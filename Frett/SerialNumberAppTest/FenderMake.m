//
//  FenderMake.m
//  SerialNumberAppTest
//
//  Created by O'Shea Douglas on 31/07/2015.
//  Copyright (c) 2015 O'Shea Douglas. All rights reserved.
//

#import "FenderMake.h"
#import <Foundation/Foundation.h>

@interface FenderMake ()

@end

@implementation FenderMake

//-(NSString*)retrieve:(NSString *)serial :(NSString *)gtrOrigin{     // called method everytime
//    NSString* year;
//    
//  if([gtrOrigin isEqual: @"USA"]) // if the carosel origin is == to USA (Call the method within this class which gets the year of the guitar)
//  {
//      year = [self retrieveFenderUsa:serial];
//  }
//  else if ([gtrOrigin isEqualToString:@"Japan"]){
//      year = [self retrieveFenderJapan:serial];
//  }
//    else
//        NSLog(@"FAIL");    // error catching heree!!!!!!!!!!!!!! final check
//   
//    return year;
//}


// Each method has its own way of retrieving data from its given country of origin.

-(NSString*)retrieveAge:(NSString *)year{
    int intYear = [[year substringWithRange:NSMakeRange(0, 4)] intValue];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString* currentYear = [formatter stringFromDate:[NSDate date]];
    int currentYearint = [currentYear intValue];
    int age = currentYearint - intYear;
    NSString* stringAge = [NSString stringWithFormat:@"%d",age];
    return stringAge;
}
-(NSString*)retrieveEra:(NSString *)year{
    NSString* eraText;
    int intYear = [[year substringWithRange:NSMakeRange(0, 4)] intValue];
    
    if(intYear >=  1945 && intYear <= 1964){
        eraText = @"Pre-CBS Era";
    } else if(intYear >= 1965 && intYear<= 1984){
        eraText = @"CBS Era";
    }else if(intYear >= 1985){
        eraText = @"Post-CBS - FMIC Era";
    }
    
    return eraText;
}
-(NSString*)retrieveOrigin:(NSString *)year originNumber:(int)countryNumber{  // in this fuction, we can return the place of manufactuing of a certain guitar.
    NSString* originText;
    int intYear = [[year substringWithRange:NSMakeRange(0, 4)] intValue];
    
    switch(countryNumber){
        case 0:
    if(intYear >= 1946 && intYear < 1985 ){ //USA factory
    originText = @"This guitar was manufactured\nin the Fender Fullerton Plant.\nCalifornia USA.";
    } else if(intYear >= 1985){
    originText = @"This guitar was manufactured\nin the Fender Corona Plant.\nCalifornia USA.";
    }
            break;
        case 1: // Japan factory
        originText = @"This guitar was maufactured\n in a Fuji-gen Plant.\nJapan Matsumoto.";
            break;
        case 2: // Mexico Factory
            originText = @"This guitar was maufactured\n in the Fender Ensenada Plant.\nEnsenada, Baja California Mexico.";
            break;
    
    default:
            break;
    }
    return originText;
}
-(NSString*)retrieveFenderUsa:(NSString *)serial {  // this method under certain conitions chooses which function to use to accomodate the serial
    NSString* year;
    if(serial.length >= 4 && serial.length <= 5){
        year = [self retrieveFenderUsaNeckPlateNumbersClassic:serial];
    }
    else if(serial.length <= 6 && [[serial substringWithRange:NSMakeRange(0, 1)]  isEqual: @"L"]){
        year = [self retrieveFenderUsaLSeries:serial];
    } else if(serial.length <= 6){
        year = [self retrieveFenderUsaFSeries:serial];
    } else if(serial.length > 6) {
        year = [self retrieveFenderUsaPost76:serial];
    }
    
   
    return year;
}
-(NSString*)retrieveFenderUsaOriginalPrecisionBass:(NSString *)serial{ // Early precision bass
    NSString* year;
    int intSerial = [serial intValue];
    if(serial.length == 3){
        if(intSerial >= 161 && intSerial <=357){
        year = @"1951";
        } else if(intSerial >= 299 && intSerial <= 619){
        year = @"1952";
        }
    }else if(serial.length >= 4) {     // serial length is 4
        if(intSerial >= 1 && intSerial <= 160){
        year = @"1952";
        } else if(intSerial >= 161 && intSerial <= 474){ // sources say 470 FR
        year = @"1951 - 1952";
        } else if(intSerial >= 475 && intSerial <= 847){ //sources say 840 FR
        year = @"1952 - 1953";
        } else if(intSerial >= 848 && intSerial <= 1897){
            year = @"1953 - 1954";
        }
    
    }
    
 
  
    return year;
}
-(NSString*)retrieveFenderUsaBridgeSerial:(NSString *)serial {
    NSString* year;
    int intSerial = [serial intValue]; // This converts the string to a serial, so operators can be used to compare the serial with years
    
    if(intSerial >= 1 && intSerial <= 999){
    year = @"1950 - 1952";
    } else if(intSerial >= 1000 && intSerial <= 6000){
    year = @"1952 - 1954";
    }

    return year;
}
-(NSString*)retrieveFenderUsaNeckPlateNumbersClassic:(NSString *)serial {
    NSString* year;
    int intSerial = [serial intValue];
    
    if(intSerial >= 1 && intSerial <= 7000){
    year = @"1954";
    } else if(intSerial >= 7001 && intSerial <= 9000) {
    year = @"1955";
    } else if(intSerial >= 9001 && intSerial <= 17000){
    year = @"1956";
    } else if(intSerial >= 17001 && intSerial <= 25000){
        year = @"1957";
    } else if(intSerial >= 25001 && intSerial <= 34000){
        year = @"1958";
    } else if(intSerial >= 34001 && intSerial <= 44000){
        year = @"1959";
    } else if(intSerial >= 44001 && intSerial <= 59000){
        year = @"1960";
    } else if(intSerial >= 59000 && intSerial <= 71000){
        year = @"1961";
    } else if(intSerial >= 71001 && intSerial <= 93000){
        year = @"1962";
    } else if(intSerial >= 93001 && intSerial <= 99999){
        year = @"1963";
    }

    return year;
}
-(NSString*)retrieveFenderUsaLSeries:(NSString *)serial{
    NSString* year;
    NSString* newString = [serial substringFromIndex:1]; // This takes the "L" off the serial, so i can be compared using operators
    int intSerial = [newString intValue];
    
    if(intSerial >= 1 && intSerial <= 20000){
        year = @"1963";
    }
    else if(intSerial >= 20001 && intSerial <= 59000){
        year = @"1964";
    }
    else if(intSerial >= 59001 && intSerial <= 99999){
        year = @"1965";
    }
 
    
    return year;
}
-(NSString*)retrieveFenderUsaFSeries:(NSString *)serial{
    NSString* year;
    int intSerial = [serial intValue];
    
    if(intSerial >= 100000 && intSerial <= 110000){
        year = @"1965";
    } else if(intSerial >= 110001 && intSerial <= 200000) {
        year = @"1966";
    } else if(intSerial >= 200001 && intSerial <= 210000){
        year = @"1967";
    } else if(intSerial >= 210001 && intSerial <= 250000){
        year = @"1968";
    } else if(intSerial >= 250001 && intSerial <= 280000){
        year = @"1969";
    } else if(intSerial >= 280001 && intSerial <= 300000){
        year = @"1970";
    } else if(intSerial >= 300001 && intSerial <= 340000){
        year = @"1971";
    } else if(intSerial >= 340001 && intSerial <= 370000){
        year = @"1972";
    } else if(intSerial >= 370001 && intSerial <= 520000){
        year = @"1973";
    } else if(intSerial >= 520001 && intSerial <= 580000){
        year = @"1974";
    } else if(intSerial >= 580001 && intSerial <= 690000){
        year = @"1975";
    } else if(intSerial >= 580001 && intSerial <= 750000){
        year = @"1976";
    }
  
    return year;
}
-(NSString*)retrieveFenderUsaPost2010:(NSString *)serial{  // This method will be called in the Post76 method below
    NSString* year;
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"post2010FenderUsa.txt"
      //                                               ofType:@"txt"];
    
    NSString* fileContents = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"post2010FenderUsa" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
  //  NSString* fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray* allLinedStrings = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];

 
  
    for(int i = 0; i <= allLinedStrings.count -1; ++i){
        
        if([[serial substringWithRange:NSMakeRange(2, 2)] isEqual:[allLinedStrings[i] substringWithRange:NSMakeRange(7, 2)]]){
            year = [allLinedStrings[i] substringToIndex:[allLinedStrings[i] length] - 4];
            break;
        }
        else
            continue;
        
    }
    
    return year;
}
-(NSString*)retrieveFenderUsaPost76:(NSString *)serial{
    NSString* year;
    NSString* fileContents = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"post1976FenderUsa" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
    //  NSString* fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray* allLinedStrings = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    if([[serial substringWithRange:NSMakeRange(0, 2)]  isEqual: @"US"]){
        year = [self retrieveFenderUsaPost2010:serial];
    }
    else {
        for(int i = 0; i <= allLinedStrings.count -1; ++i){
            if([[serial substringWithRange:NSMakeRange(0, 2)] isEqual:[allLinedStrings[i] substringWithRange:NSMakeRange(10, 2)]]){
                year = [allLinedStrings[i] substringToIndex:[allLinedStrings[i] length] - 2];
                break;
            }
            else
                continue;
        }
    }
    

    

    return year;
}
-(NSString*)retrieveFenderMadeInJapan:(NSString*) serial {
    NSString* year; //year of the guitar to return to the retrieve method.
    NSString* otherYear; // this is for the T0 && U0 guitar models, ther is no way to date them at this moment in time
    NSString* fileContents = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"japan-made" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];

    NSArray* allLinedStrings = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    //Algorithm to find the year the guitar was made
    if([[serial substringWithRange:NSMakeRange(0, 2) ]  isEqual: @"JV"]){
        year = [allLinedStrings[0] substringToIndex:[allLinedStrings[0] length] -3];
        NSLog(@"JV");
    }
    else if([[serial substringWithRange:NSMakeRange(0,2)] isEqual: @"SQ"]){
        year = [allLinedStrings[1] substringToIndex:[allLinedStrings[1] length] -3];
        NSLog(@"SQ");
    }
    else if([[serial substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"T0"])
    {
        
        otherYear = @"1994-1995";
        year = [ NSString stringWithFormat:@"%@ / %@",otherYear, [allLinedStrings[23] substringToIndex:[allLinedStrings[23] length] -1]];   // hard coded , need to revise soon
    }
    
    else if([[serial substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"U0"])
    {
        otherYear = @"1995-1996";
        year = [ NSString stringWithFormat:@"%@ / %@",otherYear, [allLinedStrings[24] substringToIndex:[allLinedStrings[24] length] -1]];   // hard coded , need to revise soon
    }
    
    else
        
        for(int i = 2; i <=allLinedStrings.count -1; ++i)
        {
            if([[serial substringWithRange:NSMakeRange(0, 1)] isEqual:[allLinedStrings[i] substringWithRange:NSMakeRange(10, 1)]]){
                year = [allLinedStrings[i] substringToIndex:[allLinedStrings[i] length] - 1];
                break;
            }
            else
                continue;
        }
    
    
    if(year == NULL)
    {
        year = @"Guitar Year Not Found";
    }
    
    return year;
}
-(NSString*)retreiveFenderCraftedInJapan:(NSString *)serial{
    // set this method up
    NSString* year;
    @try{
        
        NSString* fileContents = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"japan-crafted" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
        //  NSString* fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSArray* allLinedStrings = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
           //Algorithm to find the year the guitar was made
    
    for(int i = 0; i <= allLinedStrings.count -1; ++i){
        
        if([[serial substringWithRange:NSMakeRange(0, 1)] isEqual:[allLinedStrings[i] substringWithRange:NSMakeRange(10,1)]]){
            year = [allLinedStrings[i] substringToIndex:[allLinedStrings[i] length]-1];
            
        }
        else
            continue;
    }
    }
    @catch(NSException* e){
        NSLog(@"File not reading");
    }
    
    
    
    return year;
}     // need to fix this!!
-(NSString*)retrieveFenderMadeInMexicoPost2010:(NSString *)serial{
    NSString* year;
    NSString* fileContents = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mexico-made-post2010" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
    
    NSArray* allLinedStrings = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    //Algorithm to find the year the guitar was made
    
    for(int i = 0; i <= allLinedStrings.count -1; ++i){
        
        if([[serial substringWithRange:NSMakeRange(0, 4)] isEqual:[allLinedStrings[i] substringWithRange:NSMakeRange(5,4)]]){
            year = [allLinedStrings[i] substringToIndex:[allLinedStrings[i] length]-4];
            NSLog(@"%@",[allLinedStrings[i] substringWithRange:NSMakeRange(5,3)]);
        }
        else
            continue;
    }
    
    if(year == NULL)
    {
        year = @"Guitar Year Not Found";
    }
    
    
    return year;
    


}
-(NSString*)retrieveFenderMadeInMexico:(NSString *)serial{
    NSString* year;
    NSString* fileContents = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mexico-made" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];

    NSArray* allLinedStrings = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    //Algorithm to find the year the guitar was made
    
    for(int i = 0; i <= allLinedStrings.count -1; ++i){
        
        if([[serial substringWithRange:NSMakeRange(0, 3)] isEqual:[allLinedStrings[i] substringWithRange:NSMakeRange(5,3)]]){
            year = [allLinedStrings[i] substringToIndex:[allLinedStrings[i] length]-4];
      
        }
        else
            continue;
    }
   
    if(year == NULL){
        year = [self retrieveFenderMadeInMexicoPost2010:serial];
    }
    
    if(year == NULL)  // if still not found then throw an exemption
    {
        year = @"Guitar Year Not Found";
    }
    
    
    return year;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // NSLog(@"%@",[self retrieveFenderUsa:@"h"]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
