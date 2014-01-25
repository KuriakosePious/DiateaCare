//
//  BmiViewController.m
//  DiateaCare
//
//  Created by Aitrich on 13/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import "BmiViewController.h"

@interface BmiViewController ()

@end

@implementation BmiViewController
@synthesize segment;

@synthesize lblheight,lblweight,lblbmival,lblcolor;
@synthesize sliderheight,sliderweight;
-(IBAction)changeseg:(id)sender
{
    if (segment.selectedSegmentIndex==0)
    {
        lblheight.text=@"";
        lblweight.text=@"";
        lblbmival.text=@"";
        lblcolor.text=@"";
        sliderheight.value=0;
        sliderweight.value=0;
        lblcolor.backgroundColor=[UIColor whiteColor];
    }
    else if (segment.selectedSegmentIndex==1)
    {
        lblheight.text=@"";
        lblweight.text=@"";
        lblbmival.text=@"";
        lblcolor.text=@"";
        sliderheight.value=0;
        sliderweight.value=0;
        lblcolor.backgroundColor=[UIColor whiteColor];
    }
}

-(IBAction)heightSlider:(id)sender{
    
    if (segment.selectedSegmentIndex==0)
    {

        
    float hval=(float)heightValue.value;
    NSString *lbl=[NSString stringWithFormat:@"%f",hval];
    height.text=lbl;
    float h=[height.text floatValue];
    float w=[weight.text floatValue];
    float Val =w/((h/100)*(h/100));
    NSString *bmiResult=[NSString stringWithFormat:@"%lf",Val];
    bmiVal.text=bmiResult;
    [self range:Val];
    }
    
    else if (segment.selectedSegmentIndex==1)
    {
        float hval=(float)heightValue.value;
        NSString *lbl=[NSString stringWithFormat:@"%f",hval];
        height.text=lbl;
        float h=[height.text floatValue];
        float w=[weight.text floatValue];
        float Val =w/((h/100)*(h/100));
        NSString *bmiResult=[NSString stringWithFormat:@"%lf",Val];
        bmiVal.text=bmiResult;
        [self range:Val];

    }
    
}


-(IBAction)weightSlider:(id)sender{
    
    if (segment.selectedSegmentIndex==0)
    {
        
    float wval=(float)weightValue.value;
    NSString *label=[NSString stringWithFormat:@"%f",wval];
    weight.text=label;
    float h=[height.text floatValue];
    float w=[weight.text floatValue];
    float Val =w/((h/100)*(h/100));
    NSString *bmiResult=[NSString stringWithFormat:@"%lf",Val];
    bmiVal.text=bmiResult;
    [self range:Val];
    }
    
    else if (segment.selectedSegmentIndex==1)
    {
        
        float hval=(float)weightValue.value;
        NSString *lbl=[NSString stringWithFormat:@"%f",hval];
        weight.text=lbl;
        float h=[height.text floatValue];
        float w=[weight.text floatValue];
        float Val =w/((h/100)*(h/100));
        NSString *bmiResult=[NSString stringWithFormat:@"%lf",Val];
        bmiVal.text=bmiResult;
        [self range:Val];
    }
}

-(NSString *)range:(float)bmiVal2
{
    if (segment.selectedSegmentIndex==0)
    {
    if (bmiVal2<17.5)
    {
        lblcolor.text=@"Severly Underweight";
        lblcolor.backgroundColor=[UIColor redColor];
    }
    else if (bmiVal2<20.7)
    {
        lblcolor.text=@"Underweight";
        lblcolor.backgroundColor=[UIColor yellowColor];
    }
    else if (bmiVal2<26.4)
    {
        lblcolor.text=@"Normal";
        lblcolor.backgroundColor=[UIColor greenColor];
    }
    else if (bmiVal2<27.8)
    {
        lblcolor.text=@"Marginally Overweight";
        lblcolor.backgroundColor=[UIColor yellowColor];
    }
    
    else if (bmiVal2<31.1)
    {
        lblcolor.text=@"Overweight";
        lblcolor.backgroundColor=[UIColor orangeColor];
    }
    
    else if (bmiVal2<35)
    {
        lblcolor.text=@"Very Overweight";
        lblcolor.backgroundColor=[UIColor redColor];
    }
    else if (bmiVal2<40)
    {
        lblcolor.text=@"Severely Obese";
        lblcolor.backgroundColor=[UIColor redColor];
    }
    else if (bmiVal2<50)
    {
        lblcolor.text=@"Morbidly Obese";
        lblcolor.backgroundColor=[UIColor redColor];
    }
    else if (bmiVal2>50)
    {
        lblcolor.text=@"Super Obese";
        lblcolor.backgroundColor=[UIColor redColor];
    }
    else
    {
        lblcolor.text=@"";
        lblcolor.backgroundColor=[UIColor whiteColor];
        lblbmival.text=@"";
    }
    return lblcolor.text;
    }
    
    else if (segment.selectedSegmentIndex==1)
    {
        if (bmiVal2<17.5)
        {
            lblcolor.text=@"Severly Underweight";
            lblcolor.backgroundColor=[UIColor redColor];
        }
        else if (bmiVal2<19.1)
        {
            lblcolor.text=@"Underweight";
            lblcolor.backgroundColor=[UIColor yellowColor];
        }
        else if (bmiVal2<25.8)
        {
            lblcolor.text=@"Normal";
            lblcolor.backgroundColor=[UIColor greenColor];
        }
        else if (bmiVal2<27.3)
        {
            lblcolor.text=@"Marginally Overweight";
            lblcolor.backgroundColor=[UIColor yellowColor];
        }
        
        else if (bmiVal2<32.3)
        {
            lblcolor.text=@"Overweight";
            lblcolor.backgroundColor=[UIColor yellowColor];
        }
        
        else if (bmiVal2<35)
        {
            lblcolor.text=@"Very Overweight";
            lblcolor.backgroundColor=[UIColor orangeColor];
        }
        else if (bmiVal2<40)
        {
            lblcolor.text=@"Severely Obese";
            lblcolor.backgroundColor=[UIColor redColor];
        }
        else if (bmiVal2<50)
        {
            lblcolor.text=@"Morbidly Obese";
            lblcolor.backgroundColor=[UIColor redColor];
        }
        else if (bmiVal2>50)
        {
            lblcolor.text=@"Super Obese";
            lblcolor.backgroundColor=[UIColor redColor];
        }
        else
        {
            lblcolor.text=@"";
            lblcolor.backgroundColor=[UIColor whiteColor];
            lblbmival.text=@"";
        }
        return lblcolor.text;
    }
    return 0;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"plain_bg.png"]];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
