//
//  org.chufanFanViewController.h
//  DataTable
//
//  Created by Tony on 13-4-17.
//  Copyright (c) 2013年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "org_chufanDetailViewController.h"
#import "Global.h"
@interface org_chufanFanViewController : UIViewController{
    IBOutlet UITextField *txtName;
}
@property (strong, nonatomic) IBOutlet UISwitch *btnInfoTog;

@property (nonatomic,retain) UITextField *txtName;
- (IBAction)setInfoBtn:(id)sender;

-(IBAction)finshEnterTxt:(id)sender;
-(IBAction)closeBack:(id)sender;
-(IBAction)showMess:(id)sender;
@end
