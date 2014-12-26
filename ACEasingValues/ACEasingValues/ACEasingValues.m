//
//  ACEasingValues.m
//  ACEasingValues
//
//  Created by Albert Chu on 14/12/26.
//  Copyright (c) 2014年 Albert Chu. All rights reserved.
//

#import "ACEasingValues.h"


static NSUInteger const ACEV_FPS                        = 60;


@implementation ACEasingValues

#pragma mark - Singleton

+ (instancetype)sharedInstance
{
    static ACEasingValues *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[ACEasingValues alloc] init];
    });
    return _sharedInstance;
}

- (NSArray *)valuesArrayWithDuration:(NSTimeInterval)duration
                            function:(AHEasingFunction)function
                           fromValue:(CGFloat)fromValue
                             toValue:(CGFloat)toValue
{
    NSUInteger frameCount = duration * ACEV_FPS;
    
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:frameCount];
    
    CGFloat progress = 0.0;
    CGFloat eachPercent = 1.0 / (frameCount - 1);

    for(NSUInteger frame = 0; frame < frameCount; ++frame, progress += eachPercent)
    {
        CGFloat value = fromValue + function(progress) * (toValue - fromValue);
        [values addObject:@(value)];
    }
    
    return values;
}

@end
