//
//  serialAnswer.m
//  SerialNumberAppTest
//
//  Created by O'Shea Douglas on 07/08/2015.
//  Copyright (c) 2015 O'Shea Douglas. All rights reserved.
//

#import "serialAnswer.h"

@interface serialAnswer ()
@property (weak, nonatomic) IBOutlet UILabel *serialCountryTitle;
@property (weak, nonatomic) IBOutlet UILabel *yearsOldLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *realisedLabel;
@property (weak, nonatomic) IBOutlet UILabel *serialAnswerLabel;
@property (weak, nonatomic) IBOutlet UITextView *serialOrigin;
@property (weak, nonatomic) IBOutlet UILabel *eraLabel;

@end

@implementation serialAnswer

- (IBAction)homeButton:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];    //                           bass doesent work dont know why :(
    // Do any additional setup after loading the view.
    
    if(self.serialAnswer.sYear == NULL){
        self.serialCountryTitle.text = NULL;
        self.ageLabel.text = NULL;
        self.yearsOldLabel.text = NULL;
        self.realisedLabel.text = NULL;
        self.serialAnswerLabel.text = @"Guitar Not Found";
        self.serialOrigin.text = NULL;
        self.eraLabel.text = NULL;
        
    }else{
        
        self.serialCountryTitle.text = self.serialAnswer.sTitle;
        self.ageLabel.text = [[self serialAnswer]sAge];
        if([self.ageLabel.text isEqualToString:@"1"]){self.yearsOldLabel.text = @"year old.";} else self.yearsOldLabel.text = @"years old."; // Will change whether label states year or years old.
        self.realisedLabel.text =@"Released";
        self.serialAnswerLabel.text = self.serialAnswer.sYear;
        self.serialOrigin.text = self.serialAnswer.sOrigin;
        self.eraLabel.text = self.serialAnswer.sEra;
    }
    
    
    
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
