//
//  NSDecimalNumber+sqlRepresentation.h
//  iActiveRecord
//
//  Created by Alex Denisov on 18.01.12.
//  Copyright (c) 2012 okolodev.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDecimalNumber (sqlRepresentation)

+ (NSString *)sqlType;
- (NSString *)toSql;
+ (id)fromSql:(NSString *)sqlData;

@end
