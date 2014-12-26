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

- (void)setValueWithDuration:(NSTimeInterval)duration
                    function:(AHEasingFunction)function
                fromProgress:(CGFloat)fromProgress
                  toProgress:(CGFloat)toProgress
                    progress:(void (^)(CGFloat progress))progress
                  completion:(void (^)())completion;
@end
