//
//  Global.m
//  DataTable
//
//  Created by Tony on 13-4-21.
//  Copyright (c) 2013年 Tony. All rights reserved.
//

#import "Global.h"

@implementation Global

@synthesize togInfoBtn;

static Global *myGlobal = nil;

+(Global*) sharedInstance{
    if(myGlobal == nil){
        myGlobal = [[self alloc] init];
        myGlobal.togInfoBtn = FALSE;
    }
    return myGlobal;
}

@end
