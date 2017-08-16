//
//  SerialEnterScreen.m
//  SerialNumberAppTest
//
//  Created by O'Shea Douglas on 06/08/2015.
//  Copyright (c) 2015 O'Shea Douglas. All rights reserved.
//

#import "SerialEnterScreen.h"
#import "FenderMake.h"
#import "SerialCheckerDelegate.h"


@interface SerialEnterScreen ()
@property (weak, nonatomic) IBOutlet UITextField *serialEnter;
@property (weak, nonatomic) IBOutlet UISwitch *switchOne;
@property (weak, nonatomic) IBOutlet UILabel *switchLabelOne;

@property (weak, nonatomic) IBOutlet UITextView *switchTextBox;

@property (weak, nonatomic) IBOutlet UIImageView *crossImage;
@property (weak, nonatomic) IBOutlet UIImageView *tickImage;

@property (weak, nonatomic) IBOutlet UIImageView *japanCircle;
@property (weak, nonatomic) IBOutlet UIImageView *usaCircle;
@property (weak, nonatomic) IBOutlet UIImageView *mexicoCircle;

@property (weak, nonatomic) IBOutlet UIButton *findYearButton;
@property NSArray* gtrOrigins;
@end

@interface SerialEnterScreen() {
    Year* gtrYear;
    int currentOriginRow;
}


@end

@implementation SerialEnterScreen

- (IBAction)backButton:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)japanButton:(id)sender {
    self.findYearButton.highlighted = YES;   // may need to get rid of this
    [self.findYearButton setEnabled:NO];
    self.japanCircle.hidden = NO;
    self.usaCircle.hidden = YES;
    self.mexicoCircle.hidden = YES;
    currentOriginRow = 1;
    [[self switchOne]setEnabled:YES];
    self.switchLabelOne.text = @"CIJ";
    
    if(self.switchOne.isOn){
        self.switchTextBox.text = @"'Crafted In Japan' on the back of the neck";
        self.switchTextBox.font = [UIFont fontWithName:@"Avenir Light" size:14.0];
        self.switchTextBox.textColor = [UIColor colorWithRed:0.10 green:0 blue:0 alpha:1];
        self.switchTextBox.textAlignment = NSTextAlignmentCenter;
    }
    [[self serialEnter] setEnabled:YES];
}
- (IBAction)usaButton:(id)sender {
    self.findYearButton.highlighted = YES;
    [self.findYearButton setEnabled:NO];
    self.japanCircle.hidden = YES;
    self.usaCircle.hidden = NO;
    self.mexicoCircle.hidden = YES;
    currentOriginRow = 0;
    
    [[self switchOne]setEnabled:YES];
    self.switchLabelOne.hidden = NO;
    self.switchLabelOne.text = @"PB ";
    
    if(self.switchOne.isOn){
        self.switchTextBox.text = @"Early Precision Bass Model";
        self.switchTextBox.font = [UIFont fontWithName:@"Avenir Light" size:14.0];
        self.switchTextBox.textColor = [UIColor colorWithRed:0.10 green:0 blue:0 alpha:1];
    }
    [[self serialEnter] setEnabled:YES];
    
    
}
- (IBAction)mexicoButton:(id)sender {
    self.findYearButton.highlighted = YES;
    [self.findYearButton setEnabled:NO];
    self.japanCircle.hidden = YES;
    self.usaCircle.hidden = YES;
    self.mexicoCircle.hidden = NO;
    currentOriginRow = 2;
    [[self switchOne]setEnabled:NO];
    self.switchLabelOne.text = @"   ";
    
    if(self.switchOne.isOn){
        self.switchTextBox.text = @"";
    }
    [[self serialEnter] setEnabled:YES];
}

-(IBAction)textFieldChange:(id)sender{
    if(self.serialEnter.text.length > 0){
        [self.findYearButton setEnabled:YES];
    }
    else
        [self.findYearButton setEnabled:NO];
    
} // dont know what this is.. sort it out

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{    /// here we can use switch statments to select the correctr kind of error traping, i.e. in terms of serial code length
    //
    NSInteger length = self.serialEnter.text.length + string.length;
    
    NSRange lowercaseCharRange = [string rangeOfCharacterFromSet:[NSCharacterSet lowercaseLetterCharacterSet]];
    
    if (lowercaseCharRange.location != NSNotFound) {
        textField.text = [textField.text stringByReplacingCharactersInRange:range
                                                                 withString:[string uppercaseString]];
        return NO;
    }
    
    // First defence error trapping
    switch(currentOriginRow){
        case 0:
            // USA error traping
            if(self.switchOne.isOn){
                if(length < 3){
                    
                    [self.findYearButton setEnabled:NO];
                    self.findYearButton.highlighted = YES;
                    self.tickImage.hidden = YES;
                    self.crossImage.hidden = NO;
                } else if(length > 2){
                    //  self.testLabel.hidden = YES;
                    [self.findYearButton setEnabled:YES];
                    self.findYearButton.highlighted = NO;
                    self.tickImage.hidden = NO;
                    self.crossImage.hidden = YES;
                } else if(range.length + range.location > textField.text.length){
                    {
                        return NO;
                    }
                }
                NSUInteger newLength = [textField.text length] + [string length] - range .length;
                return newLength <=4;
                
                
            }
            else if(self.switchOne.isOn == NO){     // if the first switch is on, this will make the valid length == 4
                if(length < 2){
                    self.findYearButton.highlighted = YES;
                    self.tickImage.hidden = YES;
                    self.crossImage.hidden = NO;
                    
                    [self.findYearButton setEnabled:NO];
                    
                } else if(length > 2){
                    //  self.testLabel.hidden = YES;
                    self.findYearButton.highlighted = NO;
                    self.tickImage.hidden = NO;
                    self.crossImage.hidden = YES;
                    [self.findYearButton setEnabled:YES];
                    
                } else
                    
                    
                    
                    if(range.length + range.location > textField.text.length)
                    {
                        return NO;
                    }
                
                NSUInteger newLength = [textField.text length] + [string length] - range .length;
                return newLength <=10;
                
                
                break;
                
            case 1:
                // Japan error trapping
                
                if(length < 7){
                    self.findYearButton.highlighted = YES;
                    
                    self.tickImage.hidden = YES;
                    self.crossImage.hidden = NO;
                    [self.findYearButton setEnabled:NO];
                }
                
                else if(length > 6){
                    //  self.testLabel.hidden = YES;
                    self.findYearButton.highlighted = NO;
                    self.tickImage.hidden = NO;
                    self.crossImage.hidden = YES;
                    [self.findYearButton setEnabled:YES];
                }
                else
                    
                    if(range.length + range.location > textField.text.length)
                    {
                        return NO;
                    }
                
                newLength = [textField.text length] + [string length] - range .length;
                return newLength <=9;
                
                
            case 2:
                
                if(length < 6){
                    self.findYearButton.highlighted = YES;
                    self.tickImage.hidden = YES;
                    self.crossImage.hidden = NO;
                    [self.findYearButton setEnabled:NO];
                    
                } else if(length > 5){
                    //  self.testLabel.hidden = YES;
                    self.findYearButton.highlighted = NO;
                    self.tickImage.hidden = NO;
                    self.crossImage.hidden = YES;
                    [self.findYearButton setEnabled:YES];
                } else
                    
                    
                    
                    if(range.length + range.location > textField.text.length)
                    {
                        return NO;
                    }
                
                newLength = [textField.text length] + [string length] - range .length;
                return newLength <=10;
                
            }
            
            break;
            
        case 99:
            self.tickImage.hidden = YES;
            self.crossImage.hidden = YES;
            break;
            
    }
    
    return YES;
    
    //   return YES;
}

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)Enter:(id)sender {
    //NSInteger row;
    // row = [[self originsCarosel] selectedRowInComponent:0];
    FenderMake* f = [[FenderMake alloc] init];
    gtrYear = [[Year alloc] init];
    
    switch(currentOriginRow) {  // This switch statement, toggles the states and parameters of the switches
        case 0:      // USA Serial
            if(self.switchOne.isOn){
                gtrYear.sTitle = @"Fender USA";
                gtrYear.sYear = [f retrieveFenderUsaOriginalPrecisionBass:self.serialEnter.text];
                gtrYear.sOrigin = [f retrieveOrigin:gtrYear.sYear originNumber:currentOriginRow];
                gtrYear.sEra = [f retrieveEra:gtrYear.sYear];
                gtrYear.sAge = [f retrieveAge:gtrYear.sYear];
            } else if(self.switchOne.isOn == NO) {
                gtrYear.sTitle = @"Fender USA";
                gtrYear.sYear = [f retrieveFenderUsa:self.serialEnter.text];
                gtrYear.sOrigin = [f retrieveOrigin:gtrYear.sYear originNumber:currentOriginRow];
                gtrYear.sEra = [f retrieveEra:gtrYear.sYear];
                gtrYear.sAge = [f retrieveAge:gtrYear.sYear];
            }
            break;
            
        case 1:   // Japan Serial
            if(self.switchOne.isOn == NO){
                gtrYear.sTitle = @"Fender Japan";
                gtrYear.sYear = [f retrieveFenderMadeInJapan:self.serialEnter.text];
                gtrYear.sOrigin = [f retrieveOrigin:gtrYear.sYear originNumber:currentOriginRow];
                gtrYear.sEra = [f retrieveEra:gtrYear.sYear];
                gtrYear.sAge = [f retrieveAge:gtrYear.sYear];
            }
            else if(self.switchOne.isOn){
                gtrYear.sTitle = @"Fender Japan";
                gtrYear.sYear = [f retreiveFenderCraftedInJapan:self.serialEnter.text];
                gtrYear.sOrigin = [f retrieveOrigin:gtrYear.sYear originNumber:currentOriginRow];
                gtrYear.sEra = [f retrieveEra:gtrYear.sYear];
                gtrYear.sAge = [f retrieveAge:gtrYear.sYear];
            }
            break;
            
            
        case 2:
            gtrYear.sTitle = @"Fender Mexico";
            gtrYear.sYear = [f retrieveFenderMadeInMexico:self.serialEnter.text];
            gtrYear.sOrigin = [f retrieveOrigin:gtrYear.sYear originNumber:currentOriginRow];
            gtrYear.sEra = [f retrieveEra:gtrYear.sYear];
            gtrYear.sAge = [f retrieveAge:gtrYear.sYear];
            break;
            
        default:
            break;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.serialEnter.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    currentOriginRow = 99;
    self.gtrOrigins = @[@"USA",@"Japan",@"Mexico"];
    self.findYearButton.highlighted = YES;
    [self.findYearButton setEnabled:NO];
    self.crossImage.hidden = YES;
    self.tickImage.hidden = YES;
    self.serialEnter.delegate = self;   //   this is from when the delegate was the view controller itself
    // flag circles
    self.japanCircle.hidden = YES;
    self.usaCircle.hidden = YES;
    self.mexicoCircle.hidden = YES;
    //
    [[self switchOne]setEnabled:NO];
    //self.switchLabelOne.text = @"   ";
    
    //  self.switchOne.delegate = self;
    
    // need to detect when a switch has been toggled ot nor maybe delegation ???
    
    [self.switchOne addTarget:self action:@selector(changeSwitchOne:) forControlEvents:UIControlEventValueChanged];
    
    self.switchTextBox.text = @"";
    self.switchLabelOne.text = @"";
    
    [[self serialEnter] setEnabled:NO];
    
    //[self.view addSubview:self.switchOne];
}

- (void)changeSwitchOne:(id)sender{
    
    [[self switchOne] setEnabled:YES];
    self.switchTextBox.text = @"";
    
    switch(currentOriginRow){
        case 0:
            if(self.switchOne.isOn){
                [[self switchOne] setEnabled:YES];
                self.switchTextBox.text = @"Early Precision Bass Model";
                self.switchTextBox.font = [UIFont fontWithName:@"Avenir Light" size:14.0];
                self.switchTextBox.textColor = [UIColor colorWithRed:0.10 green:0 blue:0 alpha:1];
                self.switchTextBox.textAlignment = NSTextAlignmentCenter;
            }
            
            break;
        case 1:
            if(self.switchOne.isOn){
                [[self switchOne] setEnabled:YES];
                self.switchTextBox.text = @"'Crafted In Japan' on the back of the neck";
                self.switchTextBox.font = [UIFont fontWithName:@"Avenir Light" size:14.0];
                self.switchTextBox.textColor = [UIColor colorWithRed:0.10 green:0 blue:0 alpha:1];
                self.switchTextBox.textAlignment = NSTextAlignmentCenter;
            }else
                [[self switchOne] setEnabled:YES];
            
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([[segue identifier] isEqualToString:@"toAnswer"]){
    // Get the new view controller using [segue destinationViewController].
    serialAnswer *passData = [segue destinationViewController];
    Year* y = gtrYear;
    // Pass the selected object to the new view controller.
    [passData setSerialAnswer:y];
    }

}


@end    //Problem with crafted
