//
//  IWSession.h
//  InPlan
//
//  Created by Виталий Давыдов on 03.12.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IWCourse.h"

@interface IWSession : NSObject
/*!
 *  users ID on server
 */
@property NSString *userId;

/*!
 *  token from API server
 */
@property NSString *serverToken;

/*!
 *  perform authentification on api server with given users name and email
 *
 *  @param name  user name
 *  @param email user email
 *  @param link user's facebook page
 */
- (void)authentificateUserOnServerWithName:(NSString *)name email:(NSString *)email andLink:(NSString *)link;

/*!
 *  handler for notification that inform that request to server was sussesfull
 *
 *  @param aNotification recieved notification
 */
- (void)handleJson :(NSNotification *)aNotification;

/*!
 *  update bata base with all students
 */
- (void)updateDataBaseOfAllStudents;

/*!
 *  update data base of all courses from API server
 */
- (void)updateDataBaseOfAllCourses;

/*!
 *  delete given courses from API server and local base (from student)
 *
 *  @param course course to delete
 */
- (void)deleteCourse:(IWCourse *)course;

/*!
 *  return current session from database
 *
 *  @return current session
 */
+(IWSession *)currentSession;

@end
