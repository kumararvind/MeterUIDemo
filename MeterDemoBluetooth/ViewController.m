//
//  ViewController.m
//  MeterDemoBluetooth
//
//  Created by Infoicon on 18/04/17.
//  Copyright © 2017 InfoiconTechnologies. All rights reserved.
//

#import "ViewController.h"
#import "WMGaugeView.h"

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
@interface ViewController ()
@property (weak, nonatomic) IBOutlet WMGaugeView *viewMeter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configMeterView];
    
}

-(void)configMeterView{
    
    _viewMeter.style = [WMGaugeViewStyle3D new];
    _viewMeter.maxValue = 80.0;
    _viewMeter.showRangeLabels = NO;
    _viewMeter.rangeValues = @[ @20.0,                  @50.0,               @80.0              ];
    _viewMeter.rangeColors = @[ RGB(192, 192, 192),    RGB(192, 192, 192),  RGB(192, 192, 192)];
    _viewMeter.rangeLabels = @[ @"LOW",          @"NORMAL",             @"HIGH" ];
    _viewMeter.unitOfMeasurement = @"           km/h \n GOLDEN MOTOR";
    _viewMeter.showUnitOfMeasurement = NO;
    _viewMeter.scaleDivisions = 8;
    _viewMeter.scaleSubdivisions = 4;
    _viewMeter.showScaleShadow = NO;
    _viewMeter.showScale = NO;
    //_gaugeView.scaleDivisionsWidth = 0.008;
    // _gaugeView.scaleSubdivisionsWidth = 0.006;
    _viewMeter.rangeLabelsFontColor = [UIColor blackColor];
    _viewMeter.rangeLabelsWidth = 0.06;
    _viewMeter.rangeLabelsFont = [UIFont fontWithName:@"Helvetica" size:0.04];
    
    //
    _viewMeter.showInnerRim=NO;
    _viewMeter.showInnerBackground =NO;
//    _viewMeter.innerRimWidth =0.06;
//    _viewMeter.innerRimBorderWidth =0.02;
    
    
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(gaugeUpdateTimer:)
                                   userInfo:nil
                                    repeats:YES];
    
}

-(void)gaugeUpdateTimer:(NSTimer *)timer
{
    _viewMeter.value = rand()%(int)_viewMeter.maxValue;
//    [_gaugeView2 setValue:rand()%(int)_gaugeView2.maxValue animated:YES duration:1.6 completion:^(BOOL finished) {
//        NSLog(@"gaugeView2 animation complete");
//    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
