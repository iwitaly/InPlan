//
//  IWViewController.m
//  InPlan
//
//  Created by Виталий Давыдов on 25.11.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "IWLoginViewController.h"

@interface IWLoginViewController ()

@end

@implementation IWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)userChoseHisType:(UIButton *)sender {
    [self performSegueWithIdentifier:@"userChoseHisType" sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
