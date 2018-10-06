//
//  ViewController.h
//  ColorChartRestart
//
//  Created by TA Trung Thanh on 06/10/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *outletPenultimate;
@property (weak, nonatomic) IBOutlet UIButton *outletPrevious;
@property (weak, nonatomic) IBOutlet UIView *outletCurrent;
@property (weak, nonatomic) IBOutlet UISlider *outletSliderR;
@property (weak, nonatomic) IBOutlet UISlider *outletSliderV;
@property (weak, nonatomic) IBOutlet UISlider *outletSliderB;
- (IBAction)actionMemorizetouched:(id)sender;
- (IBAction)actionResettouched:(id)sender;
- (IBAction)actionSwitchchanged:(id)sender;
- (IBAction)actionSliderRchanged:(id)sender;
- (IBAction)actionSliderVchanged:(id)sender;
- (IBAction)actionSliderBchanged:(id)sender;



@end

