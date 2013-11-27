//
//  IWCourse.h
//  InPlan
//
//  Created by Виталий Давыдов on 26.11.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "ActiveRecord.h"
#import "IWRequiments.h"

@interface IWCourse : ActiveRecord

@property NSString *name;
@property NSData *req;//IWRequiments
@property float price;
@property NSData *professors;//NSMutableArray

+ (IWCourse *)courseWithName:(NSString *)name andPrice:(float)price;

@end
