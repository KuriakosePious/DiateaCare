//
//  EditProfileViewController.m
//  DiateaCare
//
//  Created by User on 19/06/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController

@synthesize txtname,txtmobile,txtemail,txtblood,txthousename,txthouseno,txtpin,txtplace,imgprofile;
@synthesize device;


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

-(IBAction)takePhoto:(UIButton *)sender
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    else
    {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    }
}

-(IBAction)selectPhoto:(UIButton *)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imgprofile.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)save:(id)sender
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    
    if (txtname.text.length==0 || txtmobile.text.length==0 || txtemail.text.length==0 || txtblood.text.length==0 || txthousename.text.length==0 || txthouseno.text.length==0 || txtpin.text.length==0 || txtplace.text.length==0 || imgprofile.image==Nil)
        
    {
        
        alert=[[UIAlertView alloc]initWithTitle:@"Caution" message:@"Enter Values" delegate:self cancelButtonTitle:Nil otherButtonTitles:@"OK", nil];
        [alert show];
        
    }
    
    else
        
    {
        
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Profile" inManagedObjectContext:context];
        
        if (self.device)
        {
            // Update existing device
            [self.device setValue:self.txtname.text forKey:@"name"];
            [self.device setValue:self.txtmobile.text forKey:@"mobile"];
            [self.device setValue:self.txtemail.text forKey:@"email"];
            [self.device setValue:self.txtblood.text forKey:@"blood"];
            [self.device setValue:self.txthousename.text forKey:@"housename"];
            [self.device setValue:self.txthouseno.text forKey:@"houseno"];
            [self.device setValue:self.txtpin.text forKey:@"code"];
            [self.device setValue:self.txtplace.text forKey:@"place"];
            [self.device setValue:self.imgprofile.image forKey:@"image"];
        }
        else
        {
            // Create a new device
           /* NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Profile" inManagedObjectContext:context];
            [newDevice setValue:self.nameTextField.text forKey:@"name"];
            [newDevice setValue:self.versionTextField.text forKey:@"version"];
            [newDevice setValue:self.companyTextField.text forKey:@"company"];*/
        }
        [newDevice setValue:self.txtname.text forKey:@"name"];
        
        [newDevice setValue:self.txtmobile.text forKey:@"mobile"];
        
        [newDevice setValue:self.txtemail.text forKey:@"email"];
        
        [newDevice setValue:self.txtblood.text forKey:@"blood"];
        
        [newDevice setValue:self.txthousename.text forKey:@"housename"];
        
        [newDevice setValue:self.txthouseno.text forKey:@"houseno"];
        
        [newDevice setValue:self.txtpin.text forKey:@"code"];
        
        [newDevice setValue:self.txtplace.text forKey:@"place"];
        
        [newDevice setValue:self.imgprofile.image forKeyPath:@"image"];
        
        txtname.text=@"";
        
        txtmobile.text=@"";
        
        txtemail.text=@"";
        
        txtblood.text=@"";
        
        txthousename.text=@"";
        
        txthouseno.text=@"";
        
        txtpin.text=@"";
        
        txtplace.text=@"";
        
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
    
    
    
    if (self.device)
    {
        [self.txthousename setText:[self.device valueForKey:@"housename"]];
        //[self.versionTextField setText:[self.device valueForKey:@"version"]];
        //[self.companyTextField setText:[self.device valueForKey:@"company"]];*/
        self.txtname.text=[device valueForKey:@"name"];
        
        self.txtmobile.text=[device valueForKey:@"mobile"];
        
        self.txtemail.text=[device valueForKey:@"email"];
        
        self.txtblood.text=[device valueForKey:@"blood"];
        
        //self.txthouseno.text=[device valueForKey:@"housename"];
        
        self.txthouseno.text=[device valueForKey:@"houseno"];
        
        self.txtpin.text=[device valueForKey:@"code"];
        
        self.txtplace.text=[device valueForKey:@"place"];
        
        self.imgprofile.image=[device valueForKey:@"image"];
    }	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
