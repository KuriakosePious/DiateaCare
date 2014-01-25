//
//  FoodViewController.h
//  DiateaCare
//
//  Created by User on 09/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    float sum;
    NSMutableArray *demo1;
    NSMutableArray *demo2;
}
@property (weak, nonatomic) IBOutlet UITableView *tblfood;
@property (weak, nonatomic) IBOutlet UILabel *lbltotcalorie;
@property (weak, nonatomic) IBOutlet UILabel *lblrem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *addb;

-(IBAction)add:(id)sender;
-(void)calculateTotal;
@end
