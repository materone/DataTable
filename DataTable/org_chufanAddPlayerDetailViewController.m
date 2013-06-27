//
//  org_chufanAddPlayerDetailViewController.m
//  DataTable
//
//  Created by Tony on 13-4-20.
//  Copyright (c) 2013年 Tony. All rights reserved.
//

#import "org_chufanAddPlayerDetailViewController.h"


@interface org_chufanAddPlayerDetailViewController ()

@end

@implementation org_chufanAddPlayerDetailViewController

@synthesize delegate;
@synthesize nameTextField;
@synthesize detailLable;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == 0)
		[self.nameTextField becomeFirstResponder];
}

#pragma mark - View Action
-(IBAction)didDone:(id)sender{
    NSLog(@"Done in table view");
    [self.delegate addPlayerDidDone:self] ;
    //[self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)didCancel:(id)sender{
    /*
    [self dismissViewControllerAnimated:YES completion:^(void){
        NSLog(@"Completion in cacel");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notic" message:@"Do you want cancel" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes!Done!", nil];
        [alert show];
    }];
     */
    [self.delegate addPlayerDidCancel:self];
}
- (void)viewDidUnload {
    [self setNameTextField:nil];
    [self setDetailLable:nil];
    [super viewDidUnload];
}
@end
