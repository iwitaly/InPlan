//
//  ARSQLBuilder.h
//  iActiveRecord
//
//  Created by Alex Denisov on 17.06.12.
//  Copyright (c) 2012 okolodev.org. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <sqlite3.h>

@class ActiveRecord;

@interface ARSQLBuilder : NSObject

+ (const char *)sqlOnCreateTableForRecord:(Class)aRecord;
+ (const char *)sqlOnAddColumn:(NSString *)aColumnName toRecord:(Class)aRecord;
+ (const char *)sqlOnCreateIndex:(NSString *)aColumnName forRecord:(Class)aRecord;
+ (const char *)sqlOnUpdateRecord:(ActiveRecord *)aRecord;
+ (const char *)sqlOnDropRecord:(ActiveRecord *)aRecord;

@end
