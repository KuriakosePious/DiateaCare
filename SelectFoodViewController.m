//
//  SelectFoodViewController.m
//  DiateaCare
//
//  Created by User on 10/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import "SelectFoodViewController.h"

#import "FoodViewController.h"

@interface SelectFoodViewController ()

@property (strong) NSMutableArray *devices;
@property (strong) NSManagedObject *device;
@property (strong) NSMutableArray *cellArray;
@property NSString *dateString;
@end

@implementation SelectFoodViewController

@synthesize breakfast,bcalorie,lunch,lcalorie,beverages,bevcalorie,international,intercalorie,segment;
@synthesize dateString;
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
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Food"];
    
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.tableView reloadData];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    dateString = [dateFormatter stringFromDate:currDate];
    NSLog(@"%@",dateString);
    
    breakfast=[[NSMutableArray alloc]initWithObjects:@"Egg Boiled 1",@"Egg Poached 1",@"Egg Fried 1",@"Egg Omelet 1",@"Bread slice 1",@"Bread slice with butter 1",@"Chapati 1",@"Puri 1",@"Paratha 1",@"Subji 1 cup",@"Idli 1",@"Dosa Plain 1",@"Dosa Masala 1",@"Sambhar 1cup", nil];
    
     bcalorie=[[NSMutableArray alloc]initWithObjects:@"80",@"80",@"110",@"120",@"45",@"90",@"60",@"75",@"150",@"150",@"100",@"120",@"250",@"150", nil];
    
    lunch=[[NSMutableArray alloc]initWithObjects:@"Cooked Rice/Plain 1cup",@"Cooked Rice/Fried 1cup",@"Paratha 1",@"Nan 1",@"Dal 1cup",@"Curd 1cup",@"Curry/Vegetable 1cup",@"Curry/Meat 1cup" ,@"Salad 1cup",@"Papad 1",@"Cutlet 1",@"Pickle 1tsp",@"Soup/Clear 1cup",@"Soup/Heavy 1cup", nil];
    
     lcalorie=[[NSMutableArray alloc]initWithObjects:@"120",@"150",@"150",@"150",@"150",@"100",@"150",@"175",@"100",@"45",@"75",@"30",@"75",@"75", nil];
    
        beverages=[[NSMutableArray alloc]initWithObjects:@"Tea/Black/without sugar 1cup",@"Coffee/Black/No sugar 1cup",@"Tea with milk & sugar 1cup",@"Coffee with milk & sugar 1cup",@"Milk without sugar 1cup",@"Milk with sugar 1cup",@"Milk witsugar, Horlicks 1cup",@"Fruit Juice 1cup",@"Soft Drinks 1bottle",@"Beer 1bottle",@"Soda 1bottle",@"Alcohol neat 1peg,small", nil];
    
    bevcalorie=[[NSMutableArray alloc]initWithObjects:@"10",@"10",@"45",@"45",@"60",@"75",@"120",@"120",@"90",@"200",@"10",@"75", nil];
    
    international=[[NSMutableArray alloc]initWithObjects:@"Bread Slices with Butter 1",@"Bread Slices Jam 1cup",@"Cereal with milk 1cup",@"Porridge & Milk 1cup",@"Porridge & Milk sweet 1cup",@"Sausage,bacon 1helping",@"Potato mash 1cup",@"Potato fried 1cup",@"Sandwich large 1",@"Hamburger 1pc",@"Steak & Salad 1plate",@"Spaghetti & meat 1plate",@"Baked dish 1helping",@"Fried Chicken 1helping", @"Chinese noodles 1plate",@"Chinese Fried Rice 1plate",@"Pizza", nil];
    
    intercalorie=[[NSMutableArray alloc]initWithObjects:@"120",@"120",@"130",@"120",@"150",@"120",@"100",@"200",@"250",@"250",@"300",@"450",@"400",@"200",@"450",@"450",@"400", nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (segment.selectedSegmentIndex==0)
    {
        return 4;
    }
    else
    {
        return 1;
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int q=0;
    
    if (segment.selectedSegmentIndex==0)
    {
    switch (section)
    {
        case 0:
            
            q=breakfast.count;
            
            break;
            
        case 1:
            
            q=lunch.count;
            
            break;
            
        case 2:
            
            q=beverages.count;
            
            break;
            
            case 3:
            
            q=international.count;
            
            break;
            
        default:
            
            break;
    }
        
    return q;
        
    }
    
    else
    {
        return self.devices.count;
    }
}


    
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (segment.selectedSegmentIndex==0)
    {
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    //NSString *k=@"Cell";
    //UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:k];
    
        if (cell==Nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
        switch (indexPath.section)
    {
        case 0:
            
            cell.textLabel.text=[breakfast objectAtIndex:indexPath.row];
            
            cell.detailTextLabel.text=[bcalorie objectAtIndex:indexPath.row];
            
            break;
            
       case 1:
            
            cell.textLabel.text=[lunch objectAtIndex:indexPath.row];
            
            cell.detailTextLabel.text=[lcalorie objectAtIndex:indexPath.row];
            
            break;
        
        case 2:
        
            cell.textLabel.text=[beverages objectAtIndex:indexPath.row];
            
            cell.detailTextLabel.text=[bevcalorie objectAtIndex:indexPath.row];
            break;
            
        case 3:
            
            cell.textLabel.text=[international objectAtIndex:indexPath.row];
            
            cell.detailTextLabel.text=[intercalorie objectAtIndex:indexPath.row];
            
            break;
        
        default:
        
            break;
    
    }
    
        return cell;
    
    }
    
    else
    
    {
    
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        // Configure the cell...
        NSManagedObject *device = [self.devices objectAtIndex:indexPath.row];
        
        [cell.textLabel setText:[NSString stringWithFormat:@"%@", [device valueForKey:@"foodname"]]];
        
        [cell.detailTextLabel setText:[device valueForKey:@"calorie"]];
        
        return cell;
    
    }

}

- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

//-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    NSMutableArray *t =[[NSMutableArray alloc]init];
//    [t addObject:@"1"];
//    [t addObject:@"2"];
//    [t addObject:@"3"];
//    return t;
//}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (segment.selectedSegmentIndex==0)
    {
        
    if (section==0)
    {
        return @"Breakfast";
    }
    else if(section==1)
    {
        return @"Lunch/Dinner";
    }
    else if(section==2)
    {
        return @"Beverages";
    }
    else
    {
        return @"International";
    }
    }
    else
    {
        if (section==0)
        {
            return @"User Foods";
        }
        return 0;
    }
}


-(IBAction)changeseg:(id)sender
{
    
    [self.tableView reloadData];

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"UpdateDevice"])
    {
        NSManagedObject *selectedDevice = [self.devices objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];

        SelectFoodViewController *destViewController = segue.destinationViewController;
        
        destViewController.device = selectedDevice;
    
    }
    
    if ([[segue identifier]isEqualToString:@"Pass"])
    {
       
        NSManagedObject *select = [self.devices objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        
        SelectFoodViewController *destViewController=segue.destinationViewController;
        
        destViewController.device=select;
        
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (selectedCell.accessoryType == UITableViewCellAccessoryNone)
    {
       
        //selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
        NSManagedObjectContext *context = [self managedObjectContext];
        
        // Create a new managed object
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Temp" inManagedObjectContext:context];
      
        [newDevice setValue:selectedCell.textLabel.text forKey:@"foodname"];
    
        
        [newDevice setValue:selectedCell.detailTextLabel.text forKey:@"calorie"];
        
        [newDevice setValue:dateString forKey:@"date"];
        
        NSError *error = nil;
        
        // Save the object to persistent store
        
        if (![context save:&error])
        
        {
        
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    else
        
        if (selectedCell.accessoryType == UITableViewCellAccessoryDetailDisclosureButton)
        {
            
        }
    
    
}


@end
/*
 - (NSManagedObjectContext *)managedObjectContext
 {
 NSManagedObjectContext *context = nil;
 id delegate = [[UIApplication sharedApplication] delegate];
 if ([delegate performSelector:@selector(managedObjectContext)]) {
 context = [delegate managedObjectContext];
 }
 return context;
 }
 - (void)viewDidAppear:(BOOL)animated
 {
 [super viewDidAppear:animated];
 
 // Fetch the devices from persistent data store
 NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
 NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Food"];
 self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
 
 [self.tableView reloadData];
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
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
 
 // Configure the cell...
 NSManagedObject *device = [self.devices objectAtIndex:indexPath.row];
 [cell.textLabel setText:[NSString stringWithFormat:@"%@", [device valueForKey:@"foodname"]]];
 [cell.detailTextLabel setText:[device valueForKey:@"calorie"]];
 
 
 // add friend button
 UIButton *addFriendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
 addFriendButton.frame = CGRectMake(200.0f, 5.0f, 75.0f, 30.0f);
 [addFriendButton setTitle:@"Add" forState:UIControlStateNormal];
 [cell addSubview:addFriendButton];
 [addFriendButton addTarget:self
 action:@selector(addFriend:)
 forControlEvents:UIControlEventTouchUpInside];
 
 return cell;
 }
 
 - (IBAction)addFriend:(id)sender
 {
 NSLog(@"Add friend.");
 }
 
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 
 
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 NSManagedObjectContext *context = [self managedObjectContext];
 
 if (editingStyle == UITableViewCellEditingStyleDelete)
 {
 // Delete object from database
 [context deleteObject:[self.devices objectAtIndex:indexPath.row]];
 
 NSError *error = nil;
 if (![context save:&error]) {
 NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
 return;
 }
 
 // Remove device from table view
 [self.devices removeObjectAtIndex:indexPath.row];
 [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 }
 
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 if ([[segue identifier] isEqualToString:@"UpdateDevice"]) {
 NSManagedObject *selectedDevice = [self.devices objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
 SelectFoodViewController *destViewController = segue.destinationViewController;
 destViewController.device = selectedDevice;
 }
 if ([[segue identifier]isEqualToString:@"Pass"]) {
 NSManagedObject *select = [self.devices objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
 SelectFoodViewController *destViewController=segue.destinationViewController;
 destViewController.device=select;
 }
 }
 
 - (id)initWithStyle:(UITableViewStyle)style
 {
 self = [super initWithStyle:style];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 
 - (void)viewDidLoad
 {
 
 // Uncomment the following line to preserve selection between presentations.
 // self.clearsSelectionOnViewWillAppear = NO;
 
 // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
 // self.navigationItem.rightBarButtonItem = self.editButtonItem;
 }
 
 - (void)didReceiveMemoryWarning
 {
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
 }
 
 #pragma mark - Table view data source
 
 
 /*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

/*- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 
 UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
 
 if (selectedCell.accessoryType == UITableViewCellAccessoryNone)
 {
 selectedCell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
 NSManagedObjectContext *context = [self managedObjectContext];
 
 // Create a new managed object
 NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Temp" inManagedObjectContext:context];
 [newDevice setValue:selectedCell.textLabel.text forKey:@"foodname"];
 [newDevice setValue:selectedCell.detailTextLabel.text forKey:@"calorie"];
 NSError *error = nil;
 // Save the object to persistent store
 if (![context save:&error])
 {
 NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
 }
 
 [self dismissViewControllerAnimated:YES completion:nil];
 }
 else
 if (selectedCell.accessoryType == UITableViewCellAccessoryDetailDisclosureButton)
 {
 
 }
 
 
 }*/
//Do something
// Navigation logic may go here. Create and push another view controller.
/*
 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
 // ...
 // Pass the selected object to the new view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
 */
