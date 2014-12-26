//
//  ViewController.m
//  ACEasingValues
//
//  Created by Albert Chu on 14/12/26.
//  Copyright (c) 2014年 Albert Chu. All rights reserved.
//

#import "ViewController.h"

#import "ACEasingValues.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIProgressView *progressView;

@property (nonatomic, assign) NSInteger currentFrame;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(40, 220, 280, 20)];
    [self.view addSubview:self.progressView];
    self.progressView.progress = 0.0;
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 260, 200, 100)];
    [self.view addSubview:self.label];
    self.label.text = @"0.0";
    

    
    // animate values
    
    NSTimeInterval durationTime = 3.0;
    
    NSArray *valuesArray =
    [[ACEasingValues sharedInstance]
     valuesArrayWithDuration:durationTime
     function:QuadraticEaseOut
     fromValue:0.0
     toValue:0.86];
    
    CGFloat refreshTime = durationTime / valuesArray.count;

    NSTimer *timer = [NSTimer timerWithTimeInterval:refreshTime
                                             target:self
                                           selector:@selector(refreshValue:)
                                           userInfo:valuesArray
                                            repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}

- (void)refreshValue:(NSTimer*)timer
{
    NSArray *values = (NSArray *)timer.userInfo;
    
    NSNumber *value = values[self.currentFrame];
    self.progressView.progress = [value floatValue];
    
    self.label.text = [NSString stringWithFormat:@"%.2f", [value floatValue]];;
    
    self.currentFrame++;
    
    if (self.currentFrame > (values.count - 1)) {
        [timer invalidate];
        timer = nil;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
