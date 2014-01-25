//
//  Level69ViewController.m
//  DiateaCare
//
//  Created by Aitrich on 24/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import "Level69ViewController.h"

@interface Level69ViewController ()

@end

@implementation Level69ViewController
@synthesize segment;
@synthesize txt69,txt70,txt101,txt126,txt180;
@synthesize btn126,btn180;
-(IBAction)changeseg
{
        if (segment.selectedSegmentIndex==0)
        {
            txt69.hidden=NO;
            txt70.hidden=YES;
            txt101.hidden=YES;
            txt126.hidden=YES;
            txt180.hidden=YES;
            btn126.hidden=YES;
            btn180.hidden=YES;
        }
        if (segment.selectedSegmentIndex==1)
        {
            txt69.hidden=YES;
            txt70.hidden=NO;
            txt101.hidden=YES;
            txt126.hidden=YES;
            txt180.hidden=YES;
            btn126.hidden=YES;
            btn180.hidden=YES;
        }
        if (segment.selectedSegmentIndex==2)
        {
            txt69.hidden=YES;
            txt70.hidden=YES;
            txt101.hidden=NO;
            txt126.hidden=YES;
            txt180.hidden=YES;
            btn126.hidden=YES;
            btn180.hidden=YES;
        }
        if (segment.selectedSegmentIndex==3)
        {
            txt69.hidden=YES;
            txt70.hidden=YES;
            txt101.hidden=YES;
            txt126.hidden=NO;
            txt180.hidden=YES;
            btn126.hidden=NO;
            btn180.hidden=YES;
        }
        if (segment.selectedSegmentIndex==4)
        {
            txt69.hidden=YES;
            txt70.hidden=YES;
            txt101.hidden=YES;
            txt126.hidden=YES;
            txt180.hidden=NO;
            btn126.hidden=YES;
            btn180.hidden=NO;
        }
}   

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
    txt70.hidden=YES;
    txt101.hidden=YES;
    txt126.hidden=YES;
    txt180.hidden=YES;
    btn126.hidden=YES;
    btn180.hidden=YES;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
