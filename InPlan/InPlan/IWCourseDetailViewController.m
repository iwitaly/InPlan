//
//  IWCourseDetailViewController.m
//  InPlan
//
//  Created by Виталий Давыдов on 27.11.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "IWCourseDetailViewController.h"
#import "IWStudent.h"

@interface IWCourseDetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UILabel *prof;
@property (strong, nonatomic) IBOutlet UILabel *req;
@property (strong, nonatomic) IBOutlet UIButton *buyButton;

@end

@implementation IWCourseDetailViewController

- (void)setupData {
    self.name.text = self.course.name;
    self.price.text = [NSString stringWithFormat:@"Prise of this course is: %d", (int)self.course.price];
    NSMutableArray *proff = [NSKeyedUnarchiver unarchiveObjectWithData: self.course.professors];
    NSMutableArray *req = [NSKeyedUnarchiver unarchiveObjectWithData: self.course.req];
    
    NSMutableString *prof = [[NSMutableString alloc] init];
    NSMutableString *reqs = [[NSMutableString alloc] init];
    
    for (NSString *name in proff) {
        [prof appendString:[NSString stringWithFormat:@"%@ ", name]];
    }
    for (NSString *name in req) {
        [reqs appendString:[NSString stringWithFormat:@"%@ ", name]];
    }
    
    if ([reqs isEqualToString:@""]) {
        self.req.text = @"Requiments: school";
    }
    self.prof.text = [NSString stringWithFormat:@"Proffessors: %@", prof];
    self.req.text = [NSString stringWithFormat:@"Requiments: %@", reqs];
}

- (IBAction)buyCourse {
    NSString *currentUserName = [[NSUserDefaults standardUserDefaults] stringForKey:@"name"];
    IWStudent *currentStudent = [IWStudent studentWithNameFromBase:currentUserName];
    
    if (self.course.price <= currentStudent.budget) {
        if (currentStudent.courses == nil) {
            currentStudent.courses = [[NSArray alloc] init];
        }
        
        NSArray *newArr = [NSArray arrayWithObjects:self.course.name, currentStudent.courses, nil];
        currentStudent.courses = newArr;
        currentStudent.budget -= self.course.price;
        
        self.buyButton.hidden = YES;
        
        [currentStudent update];
    }
    else {
        [[[UIAlertView alloc] initWithTitle:@"Oops!"
                                    message:@"You don't have enought money to buy that course"
                                   delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil]
         show];
    }
}

- (void)checkForBalidCourse {
    NSString *currentUserName = [[NSUserDefaults standardUserDefaults] stringForKey:@"name"];
    IWStudent *currentStudent = [IWStudent studentWithNameFromBase:currentUserName];
    
    if ([(NSString *)currentStudent.courses rangeOfString:self.course.name].location == NSNotFound) {
        self.buyButton.hidden = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self checkForBalidCourse];
    [self setupData];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
