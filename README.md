#ACEasingValues


Sometimes we want to set progress or label text with animation, it is common in a health or sport app, constant speed is OK, but easing function would be better.

This util returns a values array for you to set values like an easing animation.

[Easing functions cheat sheet](http://easings.net)


## Sample

```objc
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
```

```objc
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
```

## Inspiration

* Warren Moore - AHEasing (https://github.com/warrenm/AHEasing)
