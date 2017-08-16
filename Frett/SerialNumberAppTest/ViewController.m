//
//  ViewController.m
//  SerialNumberAppTest
//
//  Created by O'Shea Douglas on 31/07/2015.
//  Copyright (c) 2015 O'Shea Douglas. All rights reserved.
//

#import "ViewController.h"
#import "FenderMake.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *fenderButton;
@property (weak, nonatomic) IBOutlet UIButton *gibsonButton;
@property (weak, nonatomic) IBOutlet UIButton *gretschButton;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;


// Label holds the serial date, there propbably needs to be some sort of delegation involved to pass the values from the Serial enter class to the view contrller class


@property NSArray* gtrMakes;
@property NSArray* gtrOrigins;
@end

@implementation ViewController

- (IBAction)gibsonButton:(id)sender {
    [[self gibsonButton] setSelected:YES];
    [[self gretschButton] setSelected:NO];
    [[self fenderButton] setSelected:NO];
    self.makeChoice = 0;
    self.continueButton.highlighted = YES;
    [[self continueButton] setEnabled:NO];
}
- (IBAction)fenderButton:(id)sender {           // there needs to be some kind of way to tell the program which make of guitar has been toggled to toggle the right view controller on the next page. Currently there is only a fender view controller...
    [[self gibsonButton] setSelected:NO];
    [[self gretschButton] setSelected:NO];
    [[self fenderButton] setSelected:YES];
    self.makeChoice = 1;
    self.continueButton.highlighted = NO;
    [[self continueButton] setEnabled:YES];
}
- (IBAction)gretchButton:(id)sender {
    [[self gibsonButton] setSelected:NO];
    [[self gretschButton] setSelected:YES];
    [[self fenderButton] setSelected:NO];
    self.makeChoice = 2;
    self.continueButton.highlighted = YES;
    [[self continueButton] setEnabled:NO];
}
- (IBAction)enterButton:(id)sender {


}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}



- (IBAction)serialGo:(id)sender {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.gtrMakes = @[@"Gibson",@"Fender",@"Epiphone",@"Squier"];
    self.gtrOrigins = @[@"USA",@"Japan",@"China",@"India"];
 
    self.continueButton.highlighted = YES;
    [[self continueButton] setEnabled:NO];

 //   NSString* message  = @"Hello";
    
   // NSLog(@"%@",[message substringWithRange:NSMakeRange(0, 4)]);


}

-(IBAction)backToHome:(UIStoryboardSegue*)segue {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Info Endy section

- (IBAction)ndLogo:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.endy.co.uk"]];
}


@end











































