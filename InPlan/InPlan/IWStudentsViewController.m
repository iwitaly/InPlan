//
//  IWStudentsViewController.m
//  InPlan
//
//  Created by Виталий Давыдов on 28.11.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "IWStudentsViewController.h"
#import "IWStudent.h"

@interface IWStudentsViewController ()

@property NSArray *students;

@end

@implementation IWStudentsViewController

- (void)initData {
    self.students = [IWStudent allRecords];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.students.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UILabel *name = (UILabel *)[cell viewWithTag:100];
    IWStudent *student = self.students[indexPath.row];
    name.text = student.name;
    
    return cell;
}

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
