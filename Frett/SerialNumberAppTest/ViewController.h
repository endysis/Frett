//
//  ViewController.h
//  SerialNumberAppTest
//
//  Created by O'Shea Douglas on 31/07/2015.
//  Copyright (c) 2015 O'Shea Douglas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SerialEnterScreen.h"
#import "serialAnswer.h"

@interface ViewController : UIViewController <UITextFieldDelegate,UINavigationControllerDelegate>
@property NSString* serialNumber;
@property NSString* guitarMake;
@property NSString* dateRange;
@property NSString* countryOfOrigin;
@property NSInteger makeChoice; // Each button will change th value of this variable. 

@end

