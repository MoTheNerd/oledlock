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
#include <SpringBoard/SpringBoard.h>
#import <SpringBoard/SpringBoard.h>
#import <SpringBoard/SBLockScreenViewController.h>


#import <Foundation/Foundation.h>
#import <substrate.h>

@interface HaloController : NSObject

@property(nonatomic, retain) UIWindow *window;

+ (instancetype)sharedInstance;

- (void)show:(BOOL)show animated:(BOOL)animated;

@end

UIWindow *window;
HaloController *controller;


%hook SBLockScreenManager
- (void)loadViewsIfNeeded{

    %orig; //execute orig
    window = [[%c(HaloController) sharedInstance] window];
    // NSLog(@"OLEDLOCK! %@", window);
}
%end

%hook SBBacklightController
- (void)turnOnScreenFullyWithBacklightSource:(long long)arg1{
  NSLog(@"OLEDLOCK!    window hiddin status is: %d", window.hidden);
  // dispatch_async(dispatch_get_main_queue(), ^{ 
  //   controller = [%c(HaloController) sharedInstance];
  //   [controller show:YES animated:YES];
  //   NSLog(@"OLEDLOCK! %@", window);
    
    
  // });
  %orig;
}
%end

// %hook SBLockStateAggregator
// unsigned long long lstate = 3; // define dummy var same name and then perform MSHOOKIvar<type>(self, "nameOfVar");
// - (void)_updateLockState{//_updateLockState is called multiple times during unlock

//   lstate = MSHookIvar<unsigned long long>(self, "_lockState");
//   //You get valid lockState
//   %orig;
//   NSLog(@"OLEDLOCK!  lockState: %llu", lstate);

//   if (lstate == 1 || lstate == 0){
//     [UIView animateWithDuration:0.7 animations:^{
        
//     }];
//   }
// }
// %end
