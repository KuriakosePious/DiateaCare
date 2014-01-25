//
//  AddFoodViewController.h
//  DiateaCare
//
//  Created by User on 10/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddFoodViewController : UIViewController<UIAlertViewDelegate>
{
    UIAlertView *alert;
}
@property (weak, nonatomic) IBOutlet UITextField *addfoodname;
@property (weak, nonatomic) IBOutlet UITextField *addfoodcalorie;
-(IBAction)save:(id)sender;
-(IBAction)cancel:(id)sender;
@end
