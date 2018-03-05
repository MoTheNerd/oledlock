/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
*/

#import <UIKit/UIKit.h>
UIView *topView;


%hook SBLockScreenViewControllerBase
- (void)viewDidLoad{

  if (topView == NULL){
    NSLog(@"View is here");
    topView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [self view].frame.size.width, [self view].frame.size.height)];
    [topView setBackgroundColor:[UIColor blackColor]];
    [[self view] addSubview:topView];
    [topView release];
  }else{
    topView.alpha = 1;
  }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  [UIView animateWithDuration:0.3 animations:^{
      topView.alpha = 0;
  }];
}

- (void)updateStatusBarForLockScreenComeback{
  %orig;

  [UIView animateWithDuration:0.3 animations:^{
      // gotta make sure we don't go over 1
      topView.alpha = 1;
  }];
}

%end

%hook SBBacklightController


- (void)turnOnScreenFullyWithBacklightSource:(long long)arg1{
  %orig;
  topView.alpha = 1;

}

%end
