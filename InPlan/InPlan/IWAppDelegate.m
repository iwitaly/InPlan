//
//  IWAppDelegate.m
//  InPlan
//
//  Created by Виталий Давыдов on 25.11.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "IWStudent.h"
#import "IWCourse.h"
#import "ActiveRecord.h"
#import "IWAppDelegate.h"

@implementation IWAppDelegate

- (void)addCourseWithName:(NSString *)name price:(float)price requiments:(NSMutableArray *)req professors:(NSMutableArray *)prof {
    IWCourse *course = [IWCourse courseWithName:name andPrice:price];
    course.req = [NSKeyedArchiver archivedDataWithRootObject:req];
    course.professors = [NSKeyedArchiver archivedDataWithRootObject:prof];
    
    [course save];
}

- (void)addStudentWithName:(NSString *)name budget:(float)budget courses:(NSArray *)courses specialization:(IWSpecialization *)spes {
    IWStudent *student = [IWStudent studentWithName:name budget:budget courses:courses specialization:spes];
    [student save];
}

- (void)createDefaultCoursesAndUsersToDataBase {
    NSMutableArray *professors = [NSMutableArray arrayWithObjects:@"Besov", @"Beck", nil];
    NSMutableArray *requiments;
    [self addCourseWithName:@"Matan" price:100 requiments:nil professors:professors];
    
    professors = [NSMutableArray arrayWithObjects:@"Jaskov", @"Musin", nil];
    requiments = [NSMutableArray arrayWithObjects:@"Matan", nil];
    [self addCourseWithName:@"Theory of probability" price:250 requiments:requiments professors:professors];
    
    
    NSString *name = @"Eduard Maslennikov";
    [self addStudentWithName:name budget:0 courses:nil specialization:nil];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [ActiveRecord applyConfiguration:^(ARConfiguration *config) {
        config.databasePath = ARDocumentsDatabasePath(@"Table");
        NSLog(@"%@", config.databasePath);
    }];
    
//    [ActiveRecord clearDatabase];
//    [self createDefaultCoursesAndUsersToDataBase];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
