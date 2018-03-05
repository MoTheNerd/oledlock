#import <UIKit/UIKit.h>
UIView *topView;

%hook SBLockScreenViewControllerBase

- (void)viewDidLoad {
  %orig;
  if (topView == NULL) {
    NSLog(@"View is here");
    topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [self view].frame.size.width, [self view].frame.size.height)];
    [topView setBackgroundColor:[UIColor blackColor]];
    [[self view] addSubview:topView];
    [topView release];
  } else {
    topView.alpha = 1;
  }
}

- (void)touchesBegan:(NSSet<UITouch*> *)touches withEvent:(UIEvent *)event {
  [UIView animateWithDuration:0.3 animations:^{
      topView.alpha = 0;
  }];
}

- (void)updateStatusBarForLockScreenComeback {
  %orig;
  [UIView animateWithDuration:0.3 animations:^{
    topView.alpha = 1;
  }];
}

%end


%hook SBBacklightController

- (void)turnOnScreenFullyWithBacklightSource:(long long)arg1 {
  %orig;
  topView.alpha = 1;
}

%end
