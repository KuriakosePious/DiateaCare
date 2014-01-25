//
//  EditProfileViewController.h
//  DiateaCare
//
//  Created by User on 19/06/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditProfileViewController : UIViewController<UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIAlertView *alert;
}
@property (strong) NSManagedObject *device;
@property (weak, nonatomic) IBOutlet UIImageView *imgprofile;
@property (weak, nonatomic) IBOutlet UITextField *txtname;
@property (weak, nonatomic) IBOutlet UITextField *txtmobile;
@property (weak, nonatomic) IBOutlet UITextField *txtemail;
@property (weak, nonatomic) IBOutlet UITextField *txtblood;
@property (weak, nonatomic) IBOutlet UITextField *txthousename;
@property (weak, nonatomic) IBOutlet UITextField *txthouseno;
@property (weak, nonatomic) IBOutlet UITextField *txtpin;
@property (weak, nonatomic) IBOutlet UITextField *txtplace;
-(IBAction)save:(id)sender;
- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;
@end
