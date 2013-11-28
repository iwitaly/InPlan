//
//  NSData+sqlRepresentation.h
//  iActiveRecord
//
//  Created by Alex Denisov on 25.03.12.
//  Copyright (c) 2012 okolodev.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (sqlRepresentation)

- (NSString *)toSql;
+ (id)fromSql:(NSString *)sqlData;
+ (NSString *)sqlType;

@end
