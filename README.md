#ACEasingValues


Sometimes we want to set progress or label text with animation, it is common in a health or sport app, constant speed is OK, but easing function would be better.

This util gives a progress block for you to set values like an easing animation.

[Easing functions cheat sheet](http://easings.net)


## Usage

```objc
[[[ACEasingValues alloc] init]
 setValueWithDuration:3.0
 function:QuadraticEaseOut
 fromProgress:0.0
 toProgress:0.86
 progress:^(CGFloat progress) {
     
     self.progressView.progress = progress;
     
     self.label.text = [NSString stringWithFormat:@"%.2f", progress];

 } 
 completion:^{
     
     NSLog(@"complete");
     
 }];
```


## Inspiration

* Warren Moore - AHEasing (https://github.com/warrenm/AHEasing)
