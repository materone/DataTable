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
    BOOL flag ;
    CGPoint oriPoint;
    CGFloat offsetX,offsetY;//移动时x,y方向上的偏移量
    CGFloat curr_X,curr_Y;//现在截取的图片内容的原点坐标
}

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

-(void)doWiggle:(UIView*)touchView;
-(void)endWiggle:(NSTimer*)timer;
-(IBAction)endInput:(id)sender;
-(void)moveToX:(CGFloat)x ToY:(CGFloat)y;
@end
