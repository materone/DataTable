//
//  org_chufanDetailViewController.h
//  DataTable
//
//  Created by Tony on 13-1-24.
//  Copyright (c) 2013年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import "org_chufanAddPlayerDetailViewController.h";

@interface org_chufanDetailViewController : UIViewController <UISplitViewControllerDelegate,AddPlayerDetailDelegage>
{
    IBOutlet UIImageView *image;
    IBOutlet UIImageView *image2;
    IBOutlet UITextField *duration;
    IBOutlet UIButton *btnInfo;
    BOOL flag ;
    CGPoint oriPoint;
    CGFloat offsetX,offsetY;//移动时x,y方向上的偏移量
    CGFloat curr_X,curr_Y;//现在截取的图片内容的原点坐标
}

@property (strong, nonatomic) id detailItem;
- (IBAction)togInfoButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UIButton *btnInfo;

- (IBAction)altInfo:(id)sender;

-(void)doWiggle:(UIView*)touchView;
-(void)endWiggle:(NSTimer*)timer;
-(IBAction)endInput:(id)sender;
-(void)moveToX:(CGFloat)x ToY:(CGFloat)y;
@end
