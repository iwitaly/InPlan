//
//  IWMeViewController.m
//  InPlan
//
//  Created by Виталий Давыдов on 27.11.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "IWMeViewController.h"
#import "IWStudent.h"
#import "IWCourse.h"

@interface IWMeViewController ()

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *budget;
@property (strong, nonatomic) IBOutlet UILabel *courses;

@end

@implementation IWMeViewController

- (void)setParams {
    IWStudent *student = [IWStudent studentWithNameFromBase:
                          [[NSUserDefaults standardUserDefaults] stringForKey:@"name"]];
    self.name.text = student.name;
    self.budget.text = [NSString stringWithFormat:@"My budget: %d", (int)student.budget];
    
    if (!student.courses) {
        self.courses.text = @"No course yet";
    }
    else {
        NSString *newStr = [(NSString *)student.courses stringByReplacingOccurrencesOfString:@"(" withString:@""];
        newStr = [newStr stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        newStr = [newStr stringByReplacingOccurrencesOfString:@")" withString:@""];
        
        self.courses.text = [NSString stringWithFormat:@"My courses: %@", newStr];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [self setParams];
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
