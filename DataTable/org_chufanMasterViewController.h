//
//  org_chufanMasterViewController.h
//  DataTable
//
//  Created by Tony on 13-1-24.
//  Copyright (c) 2013年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@class org_chufanDetailViewController;

#import <CoreData/CoreData.h>

@interface org_chufanMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) org_chufanDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
