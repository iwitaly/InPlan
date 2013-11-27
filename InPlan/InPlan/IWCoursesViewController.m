//
//  IWCoursesViewController.m
//  InPlan
//
//  Created by Виталий Давыдов on 27.11.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "IWCoursesViewController.h"
#import "IWCourse.h"
#import "IWCourseDetailViewController.h"

@interface IWCoursesViewController ()

@property NSArray *courses;

@end

@implementation IWCoursesViewController

- (void)initArrayOfCourses {
    self.courses = [IWCourse allRecords];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initArrayOfCourses];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.courses.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"courseDetail" sender:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell viewWithTag:100];
    IWCourse *course = self.courses[indexPath.row];
    label.text = course.name;
    
    return cell;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    IWCourseDetailViewController *detail = (IWCourseDetailViewController *)segue.destinationViewController;
    UITableViewCell *cell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    detail.course = self.courses[indexPath.row];
}

@end
