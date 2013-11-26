//
//  IWStudent.h
//  InPlan
//
//  Created by Виталий Давыдов on 26.11.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "ActiveRecord.h"
#import "IWCourse.h"
#import "IWSpecialization.h"

@interface IWStudent : ActiveRecord

@property NSString *name;

@property NSString *password;

//@property NSArray *courses;

//@property IWSpecialization *specialization;

+ (IWStudent *)studentWithName:(NSString *)name andPass:(NSString *)pass;
+ (IWStudent *)studentWithNameFromBase:(NSString *)name;

@end
