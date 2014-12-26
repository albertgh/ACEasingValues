//
//  ACEasingValues.m
//  ACEasingValues
//
//  Created by Albert Chu on 14/12/26.
//  Copyright (c) 2014年 Albert Chu. All rights reserved.
//

#import "ACEasingValues.h"


@interface ACEasingValues ()

@property (nonatomic, assign) NSUInteger                currentFrame;

@end


static NSUInteger const ACEV_FPS                        = 60;


@implementation ACEasingValues

#pragma mark - Init

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.currentFrame = 0;
    }
    return self;
}

#pragma mark - Public

- (void)setValueWithDuration:(NSTimeInterval)duration
                    function:(AHEasingFunction)function
                fromProgress:(CGFloat)fromProgress
                  toProgress:(CGFloat)toProgress
                    progress:(void (^)(CGFloat progress))progress
                  completion:(void (^)())completion
{
    NSUInteger frameCount = duration * ACEV_FPS;
    
    CGFloat currentProgress = 0.0;
    CGFloat eachPercent = 1.0 / (frameCount - 1);
    
    NSMutableArray *valuesMArray = [[NSMutableArray alloc] init];
    
    for(NSUInteger frame = 0; frame < frameCount; ++frame, currentProgress += eachPercent)
    {
        CGFloat value = fromProgress + function(currentProgress) * (toProgress - fromProgress);
        [valuesMArray addObject:@(value)];
    }

    NSMutableDictionary *dictionaryForTimer = [[NSMutableDictionary alloc] init];
  
    dictionaryForTimer[@"valusesMArray"] = valuesMArray;
    
    if (progress) {
        dictionaryForTimer[@"progressBlock"] = progress;
    }
    
    if (completion) {
        dictionaryForTimer[@"completionBlock"] = completion;
    }
    
    CGFloat refreshTime = duration / valuesMArray.count;
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:refreshTime
                                             target:self
                                           selector:@selector(refreshValue:)
                                           userInfo:dictionaryForTimer
                                            repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

#pragma mark - Private

- (void)refreshValue:(NSTimer*)timer
{
    NSDictionary *infoDictionary = (NSDictionary *)timer.userInfo;
    
    NSMutableArray *valuesMArray = infoDictionary[@"valusesMArray"];
    
    void (^progressBlock)(CGFloat progress) = infoDictionary[@"progressBlock"];
    
    void (^completionBlock)() = infoDictionary[@"completionBlock"];
    
    NSNumber *currentProgress = valuesMArray[self.currentFrame];
    
    if (progressBlock) {
        progressBlock([currentProgress floatValue]);
    }
    
    self.currentFrame++;
    
    if (self.currentFrame > (valuesMArray.count - 1)) {
        [timer invalidate];
        timer = nil;
        
        
        if (completionBlock) {
            completionBlock();
        }
        self.currentFrame = 0;
    }
}

@end
