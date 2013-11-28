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
#import <Foundation/Foundation.h>

@interface IWStudent : ActiveRecord

@property (nonatomic, retain) NSString *name;

@property (readwrite) NSString *password;

@property (nonatomic, retain) NSArray *courses;

@property (readwrite) NSData *specialization; //IWSpecialization

@property (readwrite) float budget;

+ (IWStudent *)studentWithName:(NSString *)name andPass:(NSString *)pass;
+ (IWStudent *)studentWithNameFromBase:(NSString *)name;
+ (IWStudent *)studentWithName:(NSString *)name budget:(float)budget courses:(NSArray *)courses specialization:(IWSpecialization *)spes;

@end
