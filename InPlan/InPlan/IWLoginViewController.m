//
//  IWLoginViewController.m
//  InPlan
//
//  Created by Виталий Давыдов on 26.11.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "IWStudent.h"
#import "IWLoginViewController.h"

@interface IWLoginViewController ()

@property (strong, nonatomic) IBOutlet UITextField *login;
@property (strong, nonatomic) IBOutlet UITextField *password;

@end

@implementation IWLoginViewController

- (IBAction)goToMainInfo:(id)sender {
    if (![self.login.text isEqualToString:@""] && ![self.password.text isEqualToString:@""]) {
        IWStudent *studentFromBase = [IWStudent studentWithNameFromBase:self.login.text];
        if (studentFromBase) {
            if ([studentFromBase.password isEqualToString:self.password.text]) {
                studentFromBase.budget = 1000;

                [[NSUserDefaults standardUserDefaults] setObject:studentFromBase.name forKey:@"name"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                [studentFromBase update];
                
                [self performSegueWithIdentifier:@"mainSegue" sender:nil];
            }
        }
        else {
            NSLog(@"no student in base");
        }
    }
    else {
        NSLog(@"empty login or pass");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
