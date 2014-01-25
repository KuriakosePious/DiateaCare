//
//  Level180ViewController.h
//  DiateaCare
//
//  Created by User on 27/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Level180ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@property (weak, nonatomic) IBOutlet UITextView *txtdiet;
@property (weak, nonatomic) IBOutlet UITextView *txtexercise;
@property (weak, nonatomic) IBOutlet UIImageView *imgdiet
;
@property (weak, nonatomic) IBOutlet UIImageView *imgexercise;
-(IBAction)changeseg;
@end
