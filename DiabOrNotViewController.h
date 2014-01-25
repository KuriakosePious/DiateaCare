//
//  DiabOrNotViewController.h
//  DiateaCare
//
//  Created by Aitrich on 23/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiabOrNotViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)NSMutableArray *blosuglvl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UIButton *diabtn;
-(IBAction)changeseg;
@property (weak, nonatomic) IBOutlet UITextView *txtnondiae;
@property (weak, nonatomic) IBOutlet UITextView *txtdiae;
@property (weak, nonatomic) IBOutlet UIImageView *imgnondiae;
@property (weak, nonatomic) IBOutlet UIImageView *imgdia;
@end
