//
//  Level180ViewController.m
//  DiateaCare
//
//  Created by User on 27/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import "Level180ViewController.h"

@interface Level180ViewController ()

@end

@implementation Level180ViewController
@synthesize segment,txtdiet,txtexercise,imgdiet,imgexercise;
-(IBAction)changeseg
{
    if (segment.selectedSegmentIndex==0)
    {
        txtdiet.hidden=NO;
        imgdiet.hidden=NO;
        imgexercise.hidden=YES;
        txtexercise.hidden=YES;
        self.title=@"Diiet";
    }
    if (segment.selectedSegmentIndex==1)
    {
        txtexercise.hidden=NO;
        imgexercise.hidden=NO;
        imgdiet.hidden=YES;
        txtdiet.hidden=YES;
        self.title=@"Exercise";
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
    txtexercise.hidden=YES;
    imgexercise.hidden=YES;
    self.title=@"Diet";
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
