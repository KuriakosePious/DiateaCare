//
//  RandomSugarViewController.m
//  DiateaCare
//
//  Created by User on 29/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import "RandomSugarViewController.h"

@interface RandomSugarViewController ()

@end

@implementation RandomSugarViewController

@synthesize segment,txt71,txt100,txt101,txt200;

-(IBAction)changeseg
{
    if (segment.selectedSegmentIndex==0)
    {
        txt71.hidden=NO;
        txt100.hidden=YES;
        txt101.hidden=YES;
        txt200.hidden=YES;
    }
    if (segment.selectedSegmentIndex==1)
    {
        txt71.hidden=YES;
        txt100.hidden=NO;
        txt101.hidden=YES;
        txt200.hidden=YES;
    }
    if (segment.selectedSegmentIndex==2)
    {
        txt71.hidden=YES;
        txt100.hidden=YES;
        txt101.hidden=NO;
        txt200.hidden=YES;
    }
    if (segment.selectedSegmentIndex==3)
    {
        txt71.hidden=YES;
        txt100.hidden=YES;
        txt101.hidden=YES;
        txt200.hidden=NO;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    txt100.hidden=YES;
    txt101.hidden=YES;
    txt200.hidden=YES;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
