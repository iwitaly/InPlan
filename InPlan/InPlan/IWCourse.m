//
//  IWCourse.m
//  InPlan
//
//  Created by Виталий Давыдов on 26.11.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "IWCourse.h"

@implementation IWCourse

@dynamic name;
@dynamic req;
@dynamic price;
@dynamic professors;

+ (IWCourse *)courseWithName:(NSString *)name andPrice:(float)price {
    IWCourse *course = [IWCourse newRecord];
    course.name = name;
    course.price = price;
    
    return course;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %f", self.name, self.price];
}

@end
