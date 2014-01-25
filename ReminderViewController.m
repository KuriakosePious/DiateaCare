//
//  ReminderViewController.m
//  DiateaCare
//
//  Created by User on 30/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import "ReminderViewController.h"

@interface ReminderViewController ()
@property (strong) NSMutableArray *devices;
@property (strong) NSManagedObject *device;
@end

@implementation ReminderViewController

@synthesize tblreminder,datepicker,txtevent;
int x;

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the devices from persistent data store
    [self.tblreminder reloadData];
}


- (void) viewWillAppear:(BOOL)animated
{
	[self.tblreminder reloadData];
    txtevent.text=@"";
}

- (IBAction)schedulealaram:(id)sender
{
    if ([txtevent.text length] > 0)
    {
        
    [txtevent resignFirstResponder];
	
	NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
	
	// Get the current date
	NSDate *pickerDate = [self.datepicker date];
	
	// Break the date up into components
	NSDateComponents *dateComponents = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit )fromDate:pickerDate];
    
	NSDateComponents *timeComponents = [calendar components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit )fromDate:pickerDate];
	
	// Set up the fire time
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    
    [dateComps setDay:[dateComponents day]];
    
    [dateComps setMonth:[dateComponents month]];
    
    [dateComps setYear:[dateComponents year]];
    
    [dateComps setHour:[timeComponents hour]];
    
	// Notification will fire in one minute
    [dateComps setMinute:[timeComponents minute]];
    
	[dateComps setSecond:[timeComponents second]];
    
    NSDate *itemDate = [calendar dateFromComponents:dateComps];
    //[dateComps release];
    
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    localNotif.fireDate = itemDate;
    
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
	
	// Notification details
    localNotif.alertBody = [txtevent text];
	// Set the action button
    localNotif.alertAction = @"View";

    localNotif.soundName = UILocalNotificationDefaultSoundName;
        
        NSUInteger nextBadgeNumber = [[[UIApplication sharedApplication] scheduledLocalNotifications] count]+1;
        localNotif.applicationIconBadgeNumber = nextBadgeNumber;
        
        
	// Specify custom data for the notification
    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"someValue" forKey:@"someKey"];
    
    localNotif.userInfo = infoDict;
	
	// Schedule the notification
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    //[localNotif release];
	
	[self.tblreminder reloadData];
        
    }
}

- (void)renumberBadgesOfPendingNotifications
{
    // clear the badge on the icon
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    
    // first get a copy of all pending notifications (unfortunately you cannot 'modify' a pending notification)
    NSArray *pendingNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    
    // if there are any pending notifications -> adjust their badge number
    if (pendingNotifications.count != 0)
    {
        // clear all pending notifications
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        
        // the for loop will 'restore' the pending notifications, but with corrected badge numbers
        // note : a more advanced method could 'sort' the notifications first !!!
        NSUInteger badgeNbr = 1;
        
        for (UILocalNotification *notification in pendingNotifications)
        {
            // modify the badgeNumber
            notification.applicationIconBadgeNumber = badgeNbr++;
            
            // schedule 'again'
            [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        }
    }
}

/*+(void)setBadge
{
    
    NSArray *notifArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
    int count = [notifArray count];
    for (x = 0; x < count; x++)
    {
        if (count > 0 )
        {
            UILocalNotification *localNotif = [notifArray objectAtIndex:x];
            [[UIApplication sharedApplication] cancelLocalNotification:localNotif];
            localNotif.applicationIconBadgeNumber = 1;
            [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
            NSLog(@"notif: %@ badge %i", localNotif, localNotif.applicationIconBadgeNumber);
        }
    }
}*/   

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[UIApplication sharedApplication] scheduledLocalNotifications] count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
	NSArray *notificationArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
    
	UILocalNotification *notif = [notificationArray objectAtIndex:indexPath.row];
    
	
    [cell.textLabel setText:notif.alertBody];
    
	[cell.detailTextLabel setText:[notif.fireDate description]];
	
    tblreminder.scrollEnabled=NO;
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}




- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
	datepicker = nil;
    
	tblreminder = nil;
    
	txtevent = nil;
}


- (void)dealloc
{
    //[super dealloc];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end