ACEasingValues


Sometimes we want to set progress or label text with animation, it is common in a health or sport app, constant speed is OK, but easing function would be better.

This util returns a values array for you to set values like an easing animation.

[Easing functions cheat sheet](http://easings.net)


## Usage

```objc
    NSArray *valuesArray =
    [[ACEasingValues sharedInstance]
     valuesArrayWithDuration:durationTime
     function:QuadraticEaseOut
     fromValue:0.0
     toValue:0.86];
```

## Inspiration

* Warren Moore - AHEasing (https://github.com/warrenm/AHEasing)
