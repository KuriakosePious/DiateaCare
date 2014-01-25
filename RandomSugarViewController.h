//
//  RandomSugarViewController.h
//  DiateaCare
//
//  Created by User on 29/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RandomSugarViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
-(IBAction)changeseg;
@property (weak, nonatomic) IBOutlet UITextView *txt71;
@property (weak, nonatomic) IBOutlet UITextView *txt100;
@property (weak, nonatomic) IBOutlet UITextView *txt101;
@property (weak, nonatomic) IBOutlet UITextView *txt200;
@end
