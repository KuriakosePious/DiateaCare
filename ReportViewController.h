//
//  ReportViewController.h
//  DiateaCare
//
//  Created by User on 15/06/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *dateArray;
    NSMutableArray *itemstring;
}

@property (weak, nonatomic) IBOutlet UITableView *tblreport;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
-(IBAction)changeseg:(id)sender;
@end
