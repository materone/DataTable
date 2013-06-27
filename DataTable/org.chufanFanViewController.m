//
//  org.chufanFanViewController.m
//  DataTable
//
//  Created by Tony on 13-4-17.
//  Copyright (c) 2013年 Tony. All rights reserved.
//

#import "org.chufanFanViewController.h"

@interface org_chufanFanViewController ()

@end

@implementation org_chufanFanViewController

@synthesize txtName;
@synthesize btnInfoTog;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [btnInfoTog setOn:[Global sharedInstance].togInfoBtn];
}

#pragma mark - view actions

- (IBAction)setInfoBtn:(id)sender {
    [Global sharedInstance].togInfoBtn = ![Global sharedInstance].togInfoBtn;
}

-(IBAction)finshEnterTxt:(id)sender{
    [txtName resignFirstResponder];
}

-(IBAction)closeBack:(id)sender{
    [txtName resignFirstResponder];
}

-(IBAction)showMess:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notic" message:@"How many day in\nNew Line Goon\nSuch a day" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    [alert show];
}

- (void)viewDidUnload {
    [self setBtnInfoTog:nil];
    [super viewDidUnload];
}
@end
