//
//  ProfileViewController.m
//  DiateaCare
//
//  Created by Aitrich on 19/06/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
@property (strong) NSMutableArray *devices;
@property (strong) NSManagedObject *device;
@end

@implementation ProfileViewController
@synthesize tblprofile,imgprofile;
@synthesize txtname,txtmobile,txtemail,txtblood,txthouse,txthouseno,txtpin,txtplace;
@synthesize btnadd,btnedit;

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
    
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Profile"];
    
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.tblprofile reloadData];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.devices.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
        
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        
    }    // Configure the cell...
    
    NSManagedObject *device = [self.devices objectAtIndex:indexPath.row];
    [cell.textLabel setText:[NSString stringWithFormat:@"%@", [device valueForKey:@"name"]]];
    
    [cell.detailTextLabel setText:[device valueForKey:@"mobile"]];
    
    self.txtname.text=[device valueForKey:@"name"];
    
    self.txtmobile.text=[device valueForKey:@"mobile"];
    
    self.txtemail.text=[device valueForKey:@"email"];
    
    self.txtblood.text=[device valueForKey:@"blood"];
    
    self.txthouse.text=[device valueForKey:@"housename"];
    
    self.txthouseno.text=[device valueForKey:@"houseno"];
    
    self.txtpin.text=[device valueForKey:@"code"];
    
    self.txtplace.text=[device valueForKey:@"place"];
    
    self.imgprofile.image=[device valueForKey:@"image"];
    
    btnadd.enabled=NO;
    btnedit.enabled=NO;
    if (cell.textLabel.text.length>0 /*|| txtmobile.text.length==0 || txtemail.text.length==0 || txtblood.text.length==0 || txthouseno.text.length==0 || txthouseno.text.length==0 || txtpin.text.length==0 || txtplace.text.length==0 || imgprofile.image==Nil*/)
    {
        btnadd.enabled=NO;
        btnedit.enabled=YES;
    }
    
    else
    {
        btnadd.enabled=YES;
        btnedit.enabled=NO;
    }
    
    return  cell;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete object from database
        
        
        [context deleteObject:[self.devices objectAtIndex:indexPath.row]];
        
        
        NSError *error = nil;
        
        if (![context save:&error])
        {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            
            return;
        }
        
        // Remove device from table view
        
        [self.devices removeObjectAtIndex:indexPath.row];
        [self.tblprofile deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tblprofile reloadData];
    }
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
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

    btnedit.enabled=NO;
    //self.tblfood.backgroundColor = [UIColor blueColor];
    /*[self.food1 setText:[_device valueForKey:@"fodname"]];
     [self.calo setText:[_device valueForKey:@"calorie"]];
     [self.device setValue:self.txtname.text forKey:@"name"];*/
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


    //update

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Update"])
    {
        NSManagedObject *selectedDevice = [self.devices objectAtIndex:[[self.tblprofile indexPathForSelectedRow] row]];
        ProfileViewController *destViewController = segue.destinationViewController;
        destViewController.device = selectedDevice;
    }
}

@end
