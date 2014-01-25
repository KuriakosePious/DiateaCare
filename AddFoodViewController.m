//
//  AddFoodViewController.m
//  DiateaCare
//
//  Created by User on 10/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import "AddFoodViewController.h"

@interface AddFoodViewController ()

@end

@implementation AddFoodViewController

@synthesize addfoodname,addfoodcalorie;

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

- (IBAction)cancel:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)save:(id)sender
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    
    if (addfoodname.text.length==0 || addfoodcalorie.text.length==0)
        
    {
       
        alert=[[UIAlertView alloc]initWithTitle:@"Caution" message:@"Enter Values" delegate:self cancelButtonTitle:Nil otherButtonTitles:@"OK", nil];
        [alert show];
        
    }
    
    else
        
    {
        
    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:context];
        
    [newDevice setValue:self.addfoodname.text forKey:@"foodname"];
        
    [newDevice setValue:self.addfoodcalorie.text forKey:@"calorie"];
        
    addfoodname.text=@"";
        
    addfoodcalorie.text=@"";
        
    NSError *error = nil;

    // Save the object to persistent store
    if (![context save:&error])
    {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
        
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
    
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
