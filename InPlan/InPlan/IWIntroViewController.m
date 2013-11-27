//
//  IWViewController.m
//  InPlan
//
//  Created by Виталий Давыдов on 25.11.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "IWIntroViewController.h"

@interface IWIntroViewController ()

@end

@implementation IWIntroViewController

- (void)presentLogoOfMipt {
    UIImageView *mipt = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    CGPoint centre = self.view.center;
    centre.y -= 200;
    mipt.center = centre;
    
    [self.view addSubview:mipt];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self presentLogoOfMipt];
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
