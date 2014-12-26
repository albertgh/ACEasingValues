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
    

    
    // animate set values
    [[[ACEasingValues alloc] init]
     setValueWithDuration:3.0
     function:ExponentialEaseOut
     fromProgress:0.0
     toProgress:0.86
     progress:^(CGFloat progress) {
         
         self.progressView.progress = progress;
         
         self.label.text = [NSString stringWithFormat:@"%.2f", progress];
         
     }
     completion:^{
         
         NSLog(@"complete");
         
     }];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
