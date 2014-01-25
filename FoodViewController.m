//
//  FoodViewController.m
//  DiateaCare
//
//  Created by User on 09/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import "FoodViewController.h"
#import "SelectFoodViewController.h"
@interface FoodViewController ()
@property (strong) NSMutableArray *devices;
@property (strong) NSManagedObject *device;
@end

@implementation FoodViewController

float cal;
float rem;
@synthesize lbltotcalorie,lblrem,addb;

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

-(IBAction)add:(id)sender
{
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    // Check if user is already logged in
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if ([[prefs objectForKey:@"log"] intValue] == 1)
    {
        self.view.hidden = YES;
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    sum =0;

    
    [super viewDidAppear:animated];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if ([[prefs objectForKey:@"log"] intValue] == 1)
    {
        [self performSegueWithIdentifier:@"homeSeg3" sender:self];
    }
    
    // Fetch the devices from persistent data store
    
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Temp"];
    
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
     [self.tblfood reloadData];
    
    demo1=[[NSMutableArray alloc]init];
    
    demo2=[[NSMutableArray alloc]init];
    
    [self calculateTotal];
    
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    [self calculateTotal];
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
    [cell.textLabel setText:[NSString stringWithFormat:@"%@", [device valueForKey:@"foodname"]]];
    
    [cell.detailTextLabel setText:[device valueForKey:@"calorie"]];
    
    
    return  cell;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete object from database
        NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
        
        NSEntityDescription *tempr=[NSEntityDescription entityForName:@"Temp" inManagedObjectContext:managedObjectContext];
        
        NSFetchRequest *fetchRequest=[[NSFetchRequest alloc]init];
        
        [fetchRequest setEntity:tempr];
        
        NSError *error;
        
        NSArray *results = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        NSLog(@"result%@",results);
        demo2=[results valueForKey:@"calorie"];
        
        for(int i=0;i<demo2.count;i--)
        {
            NSNumber *no=[demo2 objectAtIndex:indexPath.row];
            
            cal=[no floatValue];
            NSLog(@"cal %f",cal);
            
            sum=sum-cal;
            rem=rem+cal;
            [self.tblfood reloadData];
        }
        
        lbltotcalorie.text=[NSString stringWithFormat:@"%f",sum];
        if(sum==0)
            
        {
            rem=2000;
            
            lblrem.text=[NSString stringWithFormat:@"%f",rem];
        }
        else
        {
            
            lblrem.text=[NSString stringWithFormat:@"%f",rem];
            
            
        }
        
        [context deleteObject:[self.devices objectAtIndex:indexPath.row]];
    
       
       // NSError *error = nil;
        
        
        
        if (![context save:&error])
        {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            
            return;
        }
        
        // Remove device from table view
        
        [self.devices removeObjectAtIndex:indexPath.row];
        
        [self.tblfood deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [self.tblfood reloadData];
//       NSLog(@"------%d",demo2.count);
//        [demo2 removeLastObject];
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
    self.tblfood.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Logo.jpg"]];
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


-(void)calculateTotal
{
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    
    NSEntityDescription *tempr=[NSEntityDescription entityForName:@"Temp" inManagedObjectContext:managedObjectContext];
    
    NSFetchRequest *fetchRequest=[[NSFetchRequest alloc]init];
    
    [fetchRequest setEntity:tempr];
    
    NSError *error;
    
    NSArray *results = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    NSLog(@"result%@",results);
    
    demo2=[results valueForKey:@"calorie"];
    
    for(int i=0;i<demo2.count;i++)
    {
        NSNumber *no=[demo2 objectAtIndex:i];
        
        cal=[no floatValue];
        
        sum+=cal;
        
        rem=2000-sum;
    }
   
   lbltotcalorie.text=[NSString stringWithFormat:@"%f",sum];
    if(sum==0)
    
    {
        rem=2000;
        
        lblrem.text=[NSString stringWithFormat:@"%f",rem];
    }
    else
    {
        
    lblrem.text=[NSString stringWithFormat:@"%f",rem];
       
    
    }
}
    

@end
