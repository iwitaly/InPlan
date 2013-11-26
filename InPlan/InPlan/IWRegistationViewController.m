//
//  IWRegistationViewController.m
//  InPlan
//
//  Created by Виталий Давыдов on 26.11.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "IWRegistationViewController.h"
#import "IWStudent.h"

@interface IWRegistationViewController ()

@property (strong, nonatomic) IBOutlet UITextField *login;
@property (strong, nonatomic) IBOutlet UITextField *pass;

@end

@implementation IWRegistationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (IBAction)registrStudent {
    if (![self.login.text isEqualToString:@""] && ![self.pass.text isEqualToString:@""]) {
        IWStudent *student = [IWStudent studentWithName:self.login.text andPass:self.pass.text];
        
        [student save];
                
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
