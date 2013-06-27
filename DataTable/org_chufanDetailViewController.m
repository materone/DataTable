//
//  org_chufanDetailViewController.m
//  DataTable
//
//  Created by Tony on 13-1-24.
//  Copyright (c) 2013年 Tony. All rights reserved.
//

#import "org_chufanDetailViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface org_chufanDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation org_chufanDetailViewController

@synthesize btnInfo;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    flag = YES;
    [self configureView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [btnInfo setEnabled:[Global sharedInstance].togInfoBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)endInput:(id)sender{
    [sender resignFirstResponder];
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

#pragma mark - Touch Event Method
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[[event allTouches]anyObject];
    oriPoint = [touch locationInView:self.view];
    if([touch view] == image){
        //do enlarge
        if([touch tapCount] == 2){
            if (flag) {
                //enlarge
                [image setFrame:CGRectMake(0, 0, image.image.size.width, image.image.size.height)];
                flag=!flag;
            }else{
                //resotre
                [image setFrame:CGRectMake(20, 55, 280, 160)];
                flag=!flag;
            }
            return;
        }
        //image.center = touchLocation;
    }
    /*
     else if([touch view] == image2){
        image2.center = touchLocation;
    }
     */
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[[event allTouches]anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    
    if([touch view] == image){
       //image.center = touchLocation;
        CGPoint curr_point=[touch locationInView:self.view];
        
        //分别计算x，和y方向上的移动
        
        offsetX=curr_point.x-oriPoint.x;        
        offsetY=curr_point.y-oriPoint.y;
                 
        [self moveToX:offsetX ToY:offsetY];            
         oriPoint.x=curr_point.x;
         oriPoint.y=curr_point.y;
    }else if([touch view] == image2){
        CGPoint pInView = [touch locationInView:image2];
        NSLog(@"x:%f y:%f",pInView.x,pInView.y);
        image2.center = touchLocation;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches]anyObject];
    if([touch view] == image ||[touch view] == image2){
        //[self doWiggle:[touch view]];
    }
}

-(void)doWiggle:(UIView *)touchView{
    NSString *durVal = [duration text];
    int timeVal = 2;
    if (durVal.length > 0) {
        timeVal = [durVal intValue];
    }
    
    CALayer *touchLayer=[touchView layer];
    CABasicAnimation *wiggle = [CABasicAnimation animationWithKeyPath:@"transform"];
    wiggle.duration = 0.1;
    wiggle.repeatCount = 1e37f;
    wiggle.autoreverses = YES;
    wiggle.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(touchLayer.transform, 0.1, 0.0, 1.0, 2.0)];
    [touchLayer addAnimation:wiggle forKey:@"wiggle"];
    //set a timer, to end the wiggle
    [NSTimer scheduledTimerWithTimeInterval:(timeVal) target:self selector:@selector(endWiggle:) userInfo:touchLayer repeats:NO];
}

-(void)endWiggle:(NSTimer *)timer{
    [((CALayer*)timer.userInfo)removeAllAnimations];
}

-(void)moveToX:(CGFloat)x ToY:(CGFloat)y{
    
    //计算移动后的矩形框，原点x,y坐标，矩形宽高
    
    CGFloat destX,destY,destW,destH;
    
    curr_X=destX=curr_X-x;
    
    curr_Y=destY=curr_Y-y;
    
    destW=self.view.frame.size.width;
    
    destH=self.view.frame.size.height;
    
    if (destX<0) {//左边界越界处理        
        curr_X=destX=0;
        
    }
    
    if (destY<0) {//上边界越界处理        
        curr_Y=destY=0;
        
    }
    
    if (destX+destW>image.image.size.width) {//右边界越界处理        
        curr_X=destX=image.image.size.width-destW;        
    }
    
    if (destY+destH>image.image.size.height) {//右边界越界处理        
        curr_Y=destY=image.image.size.height-destH;        
    }
    
    //创建矩形框为本fame
    
    CGRect rect = CGRectMake(destX, destY,self.view.frame.size.width, self.view.frame.size.height);        
    image.image=[UIImage imageWithCGImage:CGImageCreateWithImageInRect([image.image CGImage], rect)];
    
    
    
}

#pragma mark - Delegate Action
-(void)addPlayerDidDone:(org_chufanAddPlayerDetailViewController*) control{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)addPlayerDidCancel:(org_chufanAddPlayerDetailViewController *)control{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"AddPlayer"]||[segue.identifier isEqualToString:@"Limon"]){
        UINavigationController *nav = segue.destinationViewController;
        org_chufanAddPlayerDetailViewController *addplay = [[nav viewControllers] objectAtIndex:0];
		addplay.delegate = self; 
    }
}
-(IBAction)altInfo:(id)sender{
    UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Some Info" message:@"Hello \nWhat I lean is a quit" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Did", nil];
    [alt show];
}
- (IBAction)togInfoButton:(id)sender {
    [btnInfo setEnabled:[Global sharedInstance].togInfoBtn];
    [Global sharedInstance].togInfoBtn = ![Global sharedInstance].togInfoBtn;
}
- (void)viewDidUnload {
    [self setBtnInfo:nil];
    [super viewDidUnload];
}
@end
