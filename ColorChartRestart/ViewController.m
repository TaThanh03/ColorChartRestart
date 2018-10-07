//
//  ViewController.m
//  ColorChartRestart
//
//  Created by TA Trung Thanh on 06/10/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

#import "ViewController.h"
#import "math.h"

@interface ViewController ()
@property(readwrite,nonatomic,retain) UIColor *curentColor;
@property(readwrite,nonatomic,retain) UIColor *secondColor;
@property(readwrite,nonatomic,retain) UIColor *thirdColor;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _outletSliderR.continuous = YES;
    _outletSliderV.continuous = YES;
    _outletSliderB.continuous = YES;
    _outletSliderR.minimumValue = 0;
    _outletSliderR.maximumValue = 1;
    _outletSliderV.minimumValue = 0;
    _outletSliderV.maximumValue = 1;
    _outletSliderB.minimumValue = 0;
    _outletSliderB.maximumValue = 1;
    
    _curentColor = UIColor.grayColor;
    _secondColor = UIColor.grayColor;
    _thirdColor = UIColor.grayColor;
    //_curentColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:1];
    _outletCurrent.backgroundColor = _curentColor;
    _outletPrevious.backgroundColor = _secondColor;
    _outletPenultimate.backgroundColor = _thirdColor;
}

- (IBAction)actionMemorizetouched:(id)sender {
    [_curentColor release];
    _curentColor = [_outletCurrent.backgroundColor copy];
    [_thirdColor release];
    _thirdColor = [_secondColor retain];
    [_secondColor release];
    _secondColor = [_curentColor copy];
    _outletPrevious.backgroundColor = _secondColor;
    _outletPenultimate.backgroundColor = _thirdColor;
}

- (IBAction)actionResettouched:(id)sender {
    [_curentColor release];
    _outletSliderR.value = 0.5;
    _outletSliderV.value = 0.5;
    _outletSliderB.value = 0.5;
    [self actionSliderchanged:nil];
    _curentColor = [_outletCurrent.backgroundColor copy];
}

- (IBAction)actionSwitchchanged:(id)sender {
    
}

- (IBAction)actionSliderchanged:(id)sender {
    if (!_outletSwitch.isOn){
        int roundedR = (int)(((int)(_outletSliderR.value*100))/10)*10;
        int roundedV = (int)(((int)(_outletSliderV.value*100))/10)*10;
        int roundedB = (int)(((int)(_outletSliderB.value*100))/10)*10;
        _outletLabelR.text = [NSString stringWithFormat:@"R: %d%%", roundedR];
        _outletLabelV.text = [NSString stringWithFormat:@"V: %d%%", roundedV];
        _outletLabelB.text = [NSString stringWithFormat:@"B: %d%%", roundedB];
        //NSLog(@"%d", roundedR);
        float roundedR2 = (float)roundedR/100;
        float roundedV2 = (float)roundedV/100;
        float roundedB2 = (float)roundedB/100;
        _outletCurrent.backgroundColor = [UIColor colorWithRed:roundedR2 green:roundedV2 blue:roundedB2 alpha:1];
        
    } else {
        //NSLog(@"%f", _outletSliderR.value);
        _outletLabelR.text = [NSString stringWithFormat:@"R: %d%%", (int)(_outletSliderR.value*100)];
        _outletLabelV.text = [NSString stringWithFormat:@"V: %d%%", (int)(_outletSliderV.value*100)];
        _outletLabelB.text = [NSString stringWithFormat:@"B: %d%%", (int)(_outletSliderB.value*100)];
        _outletCurrent.backgroundColor = [UIColor colorWithRed:_outletSliderR.value green:_outletSliderV.value blue:_outletSliderB.value alpha:1];
    }
}

- (IBAction)actionButtonPenultimateTouched:(id)sender {
    CGFloat red = 0.0, green = 0.0, blue = 0.0;
    [_outletPenultimate.backgroundColor getRed:&red green:&green blue:&blue alpha:nil];
    _outletSliderR.value = red;
    _outletSliderV.value = green;
    _outletSliderB.value = blue;
    [self actionSliderchanged:nil];
    _curentColor = [_outletCurrent.backgroundColor copy];
}

- (IBAction)actionButtonPreviousTouched:(id)sender {
    CGFloat red = 0.0, green = 0.0, blue = 0.0;
    [_outletPrevious.backgroundColor getRed:&red green:&green blue:&blue alpha:nil];
    _outletSliderR.value = red;
    _outletSliderV.value = green;
    _outletSliderB.value = blue;
    [self actionSliderchanged:nil];
    _curentColor = [_outletCurrent.backgroundColor copy];
}


- (void)dealloc {
    [_outletLabelR release];
    [_outletLabelV release];
    [_outletLabelB release];
    [_outletSwitch release];
    [super dealloc];
}
@end
