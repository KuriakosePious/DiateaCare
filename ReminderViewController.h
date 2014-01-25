//
//  ReminderViewController.h
//  DiateaCare
//
//  Created by User on 30/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReminderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *tblreminder;
    IBOutlet UITextField *txtevent;
    IBOutlet UIDatePicker *datepicker;
}

@property (nonatomic,retain) IBOutlet UITextField *txtevent;

@property (nonatomic,retain) IBOutlet UITableView *tblreminder;
@property (nonatomic,retain) IBOutlet UIDatePicker *datepicker;

-(IBAction)schedulealaram:(id)sender;
//+(void)setBadge;
@end
