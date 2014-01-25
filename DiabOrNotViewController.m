//
//  DiabOrNotViewController.m
//  DiateaCare
//
//  Created by Aitrich on 23/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import "DiabOrNotViewController.h"
#import "Level69ViewController.h"
@interface DiabOrNotViewController ()
@end

@implementation DiabOrNotViewController
@synthesize segment,txtdiae,txtnondiae,imgnondiae,imgdia;
@synthesize blosuglvl,diabtn;
- (void)viewDidLoad
{
    [super viewDidLoad];
    txtnondiae.hidden=YES;
    imgnondiae.hidden=YES;
	blosuglvl=[[NSMutableArray alloc]initWithObjects:@"Less Than 69",@"70-100",@"101-125",@"126-180",@"Above181", nil];
    // Do any additional setup after loading the view.
}

-(IBAction)changeseg
{
    if (segment.selectedSegmentIndex==0)
    {
        txtdiae.hidden=NO;
        imgdia.hidden=NO;
        txtnondiae.hidden=YES;
        imgnondiae.hidden=YES;
        diabtn.hidden=NO;
    }
    
    if (segment.selectedSegmentIndex==1)
    {
        diabtn.hidden=YES;
        imgnondiae.hidden=NO;
        txtnondiae.hidden=NO;
        txtdiae.hidden=YES;
        imgdia.hidden=YES;
    }
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return blosuglvl.count;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = NSLocalizedString(@"Blood Sugar Levels", @"a");
            break;
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellidentifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==Nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }

    cell.textLabel.text=[blosuglvl objectAtIndex:indexPath.row];
    return cell;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
