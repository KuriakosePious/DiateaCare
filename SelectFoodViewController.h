//
//  SelectFoodViewController.h
//  DiateaCare
//
//  Created by User on 10/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectFoodViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)NSMutableArray *breakfast;
@property (strong,nonatomic)NSMutableArray *bcalorie;
@property (strong,nonatomic)NSMutableArray *lunch;
@property (strong,nonatomic)NSMutableArray *lcalorie;
@property (strong,nonatomic)NSMutableArray *beverages;
@property (strong,nonatomic)NSMutableArray *bevcalorie;
@property (strong,nonatomic)NSMutableArray *international;
@property (strong,nonatomic)NSMutableArray *intercalorie;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
-(IBAction)changeseg:(id)sender;
@end
