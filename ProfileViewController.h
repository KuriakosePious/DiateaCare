//
//  ProfileViewController.h
//  DiateaCare
//
//  Created by Aitrich on 19/06/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITextField *txtname;
@property (weak, nonatomic) IBOutlet UITextField *txtmobile;
@property (weak, nonatomic) IBOutlet UITextField *txtemail;
@property (weak, nonatomic) IBOutlet UITextField *txtblood;
@property (weak, nonatomic) IBOutlet UITextField *txthouse;
@property (weak, nonatomic) IBOutlet UITextField *txthouseno;
@property (weak, nonatomic) IBOutlet UITextField *txtpin;
@property (weak, nonatomic) IBOutlet UITextField *txtplace;

@property (weak, nonatomic) IBOutlet UITableView *tblprofile;
@property (weak, nonatomic) IBOutlet UIImageView *imgprofile;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnadd;
@property (weak, nonatomic) IBOutlet UIButton *btnedit;
@end
