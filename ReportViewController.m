//
//  ReportViewController.m
//  DiateaCare
//
//  Created by User on 15/06/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import "ReportViewController.h"

@interface ReportViewController ()
@property (strong) NSMutableArray *devices;
@property (strong) NSManagedObject *device;
@end

@implementation ReportViewController
@synthesize  tblreport,segment;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}
-(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context=nil;
    id delegate=[[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)] )
    {
        context=[delegate managedObjectContext];
    }
    return context;
}
-(void)viewDidAppear:(BOOL)animated
{
    [tblreport reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    dateArray=[[NSMutableArray alloc]init];
    itemstring=[[NSMutableArray alloc]init];
    [self dateextract];
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //  [self.reporttblview reloadData];
    [self dateextract];
    
    return dateArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // [self.reporttblview reloadData];
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [self dateextract];
    
    [cell.textLabel setText:[dateArray objectAtIndex:indexPath.row]];
    [cell.detailTextLabel setText:[itemstring objectAtIndex:indexPath.row]];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return  cell;
}
-(void)dateextract
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0]; //This variable should now be pointing at a date object that is the start of today (midnight);
    
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday = [cal dateByAddingComponents:components toDate: today options:0];
    
    components = [cal components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:[[NSDate alloc] init]];
    
    [components setDay:([components day] - ([components weekday] - 1))];
    NSDate *thisWeek  = [cal dateFromComponents:components];
    
    [components setDay:([components day] - 7)];
    NSDate *lastWeek  = [cal dateFromComponents:components];
    
    [components setDay:([components day] - ([components day] -1))];
    NSDate *thisMonth = [cal dateFromComponents:components];
    
    [components setMonth:([components month] - 1)];
    NSDate *lastMonth = [cal dateFromComponents:components];
    
    NSLog(@"today=%@",today);
    NSLog(@"yesterday=%@",yesterday);
    NSLog(@"thisWeek=%@",thisWeek);
    NSLog(@"lastWeek=%@",lastWeek);
    NSLog(@"thisMonth=%@",thisMonth);
    NSLog(@"lastMonth=%@",lastMonth);
    
    if (segment.selectedSegmentIndex==0)
    {
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
    [dateformatter setDateFormat:@"dd/MM/yyyy"];
   // NSDate *dat=[NSDate date];
    NSString *toda=[dateformatter stringFromDate:today];
    NSManagedObjectContext *managedobj=[self managedObjectContext];
    NSEntityDescription *entitydes=[NSEntityDescription entityForName:@"Temp" inManagedObjectContext:managedobj];
    NSPredicate *pred=[NSPredicate predicateWithFormat:@"(date==%@)",toda];
    NSFetchRequest *fetreq=[[NSFetchRequest alloc]init];
    [fetreq setEntity:entitydes];
    [fetreq setPredicate:pred];
    NSError *err;
    NSArray *result=[managedobj executeFetchRequest:fetreq error:&err];
    dateArray=[result valueForKey:@"date"];
    itemstring=[result valueForKey:@"foodname"];
    }
    
    else if (segment.selectedSegmentIndex==1)
    {
        NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
        [dateformatter setDateFormat:@"dd/MM/yyyy"];
        // NSDate *dat=[NSDate date];
        NSString *yester=[dateformatter stringFromDate:yesterday];
        NSManagedObjectContext *managedobj=[self managedObjectContext];
        NSEntityDescription *entitydes=[NSEntityDescription entityForName:@"Temp" inManagedObjectContext:managedobj];
        NSPredicate *pred=[NSPredicate predicateWithFormat:@"(date==%@)",yester];
        NSFetchRequest *fetreq=[[NSFetchRequest alloc]init];
        [fetreq setEntity:entitydes];
        [fetreq setPredicate:pred];
        NSError *err;
        NSArray *result=[managedobj executeFetchRequest:fetreq error:&err];
        dateArray=[result valueForKey:@"date"];
        itemstring=[result valueForKey:@"foodname"];
    }
    
    /*else if (segment.selectedSegmentIndex==2)
    {
        NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
        [dateformatter setDateFormat:@"dd/MM/yyyy"];
        // NSDate *dat=[NSDate date];
        NSString *week=[dateformatter stringFromDate:thisWeek];
        NSManagedObjectContext *managedobj=[self managedObjectContext];
        NSEntityDescription *entitydes=[NSEntityDescription entityForName:@"Temp" inManagedObjectContext:managedobj];
        NSPredicate *pred=[NSPredicate predicateWithFormat:@"(date==%@)",week];
        NSFetchRequest *fetreq=[[NSFetchRequest alloc]init];
        [fetreq setEntity:entitydes];
        [fetreq setPredicate:pred];
        NSError *err;
        NSArray *result=[managedobj executeFetchRequest:fetreq error:&err];
        dateArray=[result valueForKey:@"date"];
        itemstring=[result valueForKey:@"foodname"];
    }
    
    else if (segment.selectedSegmentIndex==3)
    {
        NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
        [dateformatter setDateFormat:@"dd/MM/yyyy"];
        // NSDate *dat=[NSDate date];
        NSString *month=[dateformatter stringFromDate:thisMonth];
        NSManagedObjectContext *managedobj=[self managedObjectContext];
        NSEntityDescription *entitydes=[NSEntityDescription entityForName:@"Temp" inManagedObjectContext:managedobj];
        NSPredicate *pred=[NSPredicate predicateWithFormat:@"(date==%@)",month];
        NSFetchRequest *fetreq=[[NSFetchRequest alloc]init];
        [fetreq setEntity:entitydes];
        [fetreq setPredicate:pred];
        NSError *err;
        NSArray *result=[managedobj executeFetchRequest:fetreq error:&err];
        dateArray=[result valueForKey:@"date"];
        itemstring=[result valueForKey:@"foodname"];
    }*/
    
}
-(IBAction)changeseg:(id)sender
{
    if (segment.selectedSegmentIndex==0)
    {
        [tblreport reloadData];
    }
    else if (segment.selectedSegmentIndex==1)
    {
        [tblreport reloadData];
    }
   /* else if (segment.selectedSegmentIndex==2)
    {
        [tblreport reloadData];
    }
    else if (segment.selectedSegmentIndex==3)
    {
        [tblreport reloadData];
    }*/
}
@end