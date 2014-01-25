//
//  BmiViewController.h
//  DiateaCare
//
//  Created by Aitrich on 13/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BmiViewController : UIViewController
{
    IBOutlet UISlider *heightValue;
    IBOutlet UISlider *weightValue;
    IBOutlet UILabel *height;
    IBOutlet UILabel *weight;
    IBOutlet UILabel *bmiVal;
}
@property (weak, nonatomic) IBOutlet UILabel *lblheight;
@property (weak, nonatomic) IBOutlet UILabel *lblweight;
@property (weak, nonatomic) IBOutlet UILabel *lblbmival;
@property (weak, nonatomic) IBOutlet UILabel *lblcolor;

@property (weak, nonatomic) IBOutlet UISlider *sliderheight;
@property (weak, nonatomic) IBOutlet UISlider *sliderweight;



-(IBAction)heightSlider:(id)sender;
-(IBAction)weightSlider:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
-(IBAction)changeseg:(id)sender;
-(NSString *)range:(float)bmiVal;
@end
