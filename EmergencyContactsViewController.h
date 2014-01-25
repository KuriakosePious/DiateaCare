//
//  EmergencyContactsViewController.h
//  DiateaCare
//
//  Created by Aitrich on 03/06/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmergencyContactsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSString *a;
}
@property (weak, nonatomic) IBOutlet UITableView *tblcontact;
@property (weak, nonatomic) IBOutlet UITextField *txtphone;
//-(IBAction)call:(id)sender;
-(IBAction)dialButtonPressed:(UIButton *)pressedButton;
@end