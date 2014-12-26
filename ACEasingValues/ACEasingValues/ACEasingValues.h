//
//  ACEasingValues.h
//  ACEasingValues
//
//  Created by Albert Chu on 14/12/26.
//  Copyright (c) 2014年 Albert Chu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

#import "easing.h"

@interface ACEasingValues : NSObject

+ (instancetype)sharedInstance;

- (NSArray *)valuesArrayWithDuration:(NSTimeInterval)duration
                            function:(AHEasingFunction)function
                           fromValue:(CGFloat)fromValue
                             toValue:(CGFloat)toValue;
@end
