//
//  FromContactsViewController.m
//  DiateaCare
//
//  Created by User on 20/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import "FromContactsViewController.h"
#import <AddressBook/AddressBook.h>
#import "Person.h"
@interface FromContactsViewController ()
@property (nonatomic, strong) NSMutableArray *tableData;

@end

@implementation FromContactsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Contacts";
    self.tableData = [[NSMutableArray alloc] init];
    [self getPersonOutOfAddressBook];

	// Do any additional setup after loading the view.
}

- (void)getPersonOutOfAddressBook

{
    
    //1
    
    CFErrorRef error = NULL;
    
    
    
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &error);
    
    
    
    if (addressBook != nil)
        
    {
        
        NSLog(@"Succesful.");
        
        //2
        
        NSArray *allContacts = (__bridge_transfer NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
        
        
        
        //3
        
        NSUInteger i = 0;
        
        for (i = 0; i < [allContacts count]; i++)
            
        {
            
            Person *person = [[Person alloc] init];
            
            
            
            ABRecordRef contactPerson = (__bridge ABRecordRef)allContacts[i];
            
            
            
            //4
            
            NSString *firstName = (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson, kABPersonFirstNameProperty);
            
            NSString *lastName =  (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson, kABPersonLastNameProperty);
            
            NSString *fullName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
            
            
            
            person.firstName = firstName;
            
            person.lastName = lastName;
            
            person.fullName = fullName;
            
            
            
            //email
            
            //5
            
            ABMultiValueRef emails = ABRecordCopyValue(contactPerson, kABPersonEmailProperty);
            
            
            
            //6
            
            NSUInteger j = 0;
            
            for (j = 0; j < ABMultiValueGetCount(emails); j++)
                
            {
                
                NSString *email = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(emails, j);
                
                if (j == 0)
                    
                {
                    
                    person.homeEmail = email;
                    
                    NSLog(@"person.homeEmail = %@ ", person.homeEmail);
                    
                }
                
                
                else if (j==1)
                    
                    person.workEmail = email;
                
            }
            
            //phone
            
            ABMultiValueRef phonenumber = ABRecordCopyValue(contactPerson, kABPersonPhoneProperty);
            
            NSUInteger k = 0;
            
            for (k=0; k<ABMultiValueGetCount(phonenumber); k++)
                
            {
                NSString *phone = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(phonenumber, k);
                
                if (k ==0)
                    
                {
                    
                    person.phone=phone;
                    
                    NSLog(@"person.phone = %@",person.phone);
                    
                }
                
            }
            
            
            //7
            
            [self.tableData addObject:person];
            
        }
        
        
        //8
        
        CFRelease(addressBook);
        
    }
    
    else
        
    {
        
        //9
        
        NSLog(@"Error reading Address Book");
        
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return [self.tableData count];
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    static NSString *cellIdentifier = @"Identifier";
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    

    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    Person *person = [self.tableData objectAtIndex:indexPath.row];

    cell.textLabel.text = person.fullName;

    cell.detailTextLabel.text=person.phone;
    
    return cell;
    
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (selectedCell.accessoryType == UITableViewCellAccessoryNone)
    {
        
        //selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
        NSManagedObjectContext *context = [self managedObjectContext];
        
        // Create a new managed object
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:context];
        
        [newDevice setValue:selectedCell.textLabel.text forKey:@"name"];
        
        [newDevice setValue:selectedCell.detailTextLabel.text forKey:@"number"];
        
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
        
        
        




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
