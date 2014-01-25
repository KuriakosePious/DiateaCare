//
//  EmergencyContactsViewController.m
//  DiateaCare
//
//  Created by Aitrich on 03/06/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import "EmergencyContactsViewController.h"

@interface EmergencyContactsViewController ()

@property (strong) NSMutableArray *devices;
@property (strong) NSManagedObject *device;

@end

@implementation EmergencyContactsViewController
@synthesize tblcontact,txtphone;

- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    // Fetch the devices from persistent data store
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Contacts"];
    
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.tblcontact reloadData];
    
}

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
    
    [cell.detailTextLabel setText:[device valueForKey:@"number"]];
    
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (selectedCell.accessoryType == UITableViewCellAccessoryNone)
    {
        
        //selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        a=[selectedCell.detailTextLabel text];
        
        txtphone.text=[NSString stringWithFormat:@"%@",a];
        
    }
    
    else
        
        if (selectedCell.accessoryType == UITableViewCellAccessoryDetailDisclosureButton)
        {
            
        }
    
    
}

-(IBAction)dialButtonPressed:(UIButton *)numberButton
{
    NSString *phoneLinkString = [NSString stringWithFormat:@"tel:%@", self->a];
    NSURL *phoneLinkURL = [NSURL URLWithString:phoneLinkString];
    [[UIApplication sharedApplication] openURL:phoneLinkURL];
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
        [self.tblcontact deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
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
        self.tblcontact.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"emergency.jpg"]];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
