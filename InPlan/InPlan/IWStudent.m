//
//  IWStudent.m
//  InPlan
//
//  Created by Виталий Давыдов on 26.11.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "IWStudent.h"

@interface IWStudent ()

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

+ (IWStudent *)studentWithName:(NSString *)name budget:(float)budget courses:(NSArray *)courses specialization:(IWSpecialization *)spes {
    IWStudent *student = [IWStudent newRecord];
    student.name = name;
    student.budget = budget;
    student.courses = courses;
    student.specialization = [NSKeyedArchiver archivedDataWithRootObject:spes];
    
    return student;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"students name %@, courses %@", self.name, self.courses];
}

@end
