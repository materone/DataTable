//
//  org_chufanDetailViewController.h
//  DataTable
//
//  Created by Tony on 13-1-24.
//  Copyright (c) 2013年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface org_chufanDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
