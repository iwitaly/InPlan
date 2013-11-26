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
//@property IWRequiments *req;
@property float price;
//@property NSArray *professors;

@end
