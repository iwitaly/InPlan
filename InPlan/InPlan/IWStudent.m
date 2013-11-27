//
//  IWStudent.m
//  InPlan
//
//  Created by Виталий Давыдов on 26.11.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "IWStudent.h"

@interface IWStudent ()

@property float budget;
@property NSData *marks;

@end

@implementation IWStudent

@dynamic name;
@dynamic password;
@dynamic courses;
@dynamic specialization;
@dynamic budget;
@dynamic marks;

+ (IWStudent *)studentWithName:(NSString *)name andPass:(NSString *)pass {
    IWStudent *student = [IWStudent newRecord];
    student.name = name;
    student.password = pass;
    
    return student;
}

+ (IWStudent *)studentWithNameFromBase:(NSString *)name {
    NSArray *fetchedStudents = [[[IWStudent lazyFetcher] where:@"name = %@", name, nil] fetchRecords];
    IWStudent *student = fetchedStudents.firstObject;
    
    return student;
}


@end
