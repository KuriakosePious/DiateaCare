//
//  LoginViewController.m
//  DiateaCare
//
//  Created by Aitrich on 24/09/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    
	// Do any additional setup after loading the view.
}

-(IBAction)test:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey: @"saved"];
    self.view.hidden=YES;
}

/*-(void) downloadCovers
{
    BOOL downloaded = [[NSUserDefaults standardUserDefaults] boolForKey: @"downloaded"];
    self.view.hidden=YES;
    if (!downloaded)
    {
        //download code here
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey: @"downloaded"];
    }
}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
