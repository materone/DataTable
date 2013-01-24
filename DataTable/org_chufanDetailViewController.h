//
//  org_chufanDetailViewController.h
//  DataTable
//
//  Created by Tony on 13-1-24.
//  Copyright (c) 2013年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface org_chufanDetailViewController : UIViewController <UISplitViewControllerDelegate>
{
    IBOutlet UIImageView *image;
    IBOutlet UIImageView *image2;
    IBOutlet UITextField *duration;
    BOOL flag;
}

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

-(void)doWiggle:(UIView*)touchView;
-(void)endWiggle:(NSTimer*)timer;
-(IBAction)endInput:(id)sender;
@end
