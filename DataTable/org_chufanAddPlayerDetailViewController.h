//
//  org_chufanAddPlayerDetailViewController.h
//  DataTable
//
//  Created by Tony on 13-4-20.
//  Copyright (c) 2013年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@class org_chufanAddPlayerDetailViewController;

@protocol AddPlayerDetailDelegage <NSObject>
-(void)addPlayerDidDone:(org_chufanAddPlayerDetailViewController*) control;
-(void)addPlayerDidCancel:(org_chufanAddPlayerDetailViewController *)control;
@end

@interface org_chufanAddPlayerDetailViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UILabel *detailLable;

@property (nonatomic,weak) id<AddPlayerDetailDelegage> delegate;

-(IBAction)didDone:(id)sender;
-(IBAction)didCancel:(id)sender;
@end
