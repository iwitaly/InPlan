//
//  IWCourseDetailViewController.m
//  InPlan
//
//  Created by Виталий Давыдов on 27.11.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "IWCourseDetailViewController.h"

@interface IWCourseDetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UILabel *prof;
@property (strong, nonatomic) IBOutlet UILabel *req;

@end

@implementation IWCourseDetailViewController

- (void)setupData {
    self.name.text = self.course.name;
    self.price.text = [NSString stringWithFormat:@"Prise of this course is: %d", (int)self.course.price];
    NSArray *proff = [NSKeyedUnarchiver unarchiveObjectWithData: self.course.professors];
    NSArray *req = [NSKeyedUnarchiver unarchiveObjectWithData: self.course.req];
    
    NSMutableString *prof = [[NSMutableString alloc] init];
    NSMutableString *reqs = [[NSMutableString alloc] init];
    
    for (NSString *name in proff) {
        [prof appendString:[NSString stringWithFormat:@"%@ ", name]];
    }
    for (NSString *name in req) {
        [reqs appendString:[NSString stringWithFormat:@"%@ ", name]];
    }
    
    self.prof.text = [NSString stringWithFormat:@"Proffessors: %@", prof];
    self.req.text = [NSString stringWithFormat:@"Requiments: %@", reqs];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
