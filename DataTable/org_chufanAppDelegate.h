//
//  org_chufanAppDelegate.h
//  DataTable
//
//  Created by Tony on 13-1-24.
//  Copyright (c) 2013年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface org_chufanAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
