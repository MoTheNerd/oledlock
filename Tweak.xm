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
%hook SBLockScreenViewControllerBase

  -(void)screenWakeAnimationController:(id)arg1 setRelevantViewsHidden:(_Bool)arg2 forRequester:(id)arg3{
    NSLog(@"Shit");
  }

  - (void)setInScreenOffMode:(_Bool)arg1{
    %orig;
    //you can call other thing here
    NSLog(@"K, Bye");

  }

%end


%hook SBLockScreenManager
- (void)tapToWakeControllerDidRecognizeWakeGesture:(id)arg1{
  //%orig;
  //this is where you want to inject the OLED display.

  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Do you want to say hello?"
                                                message:@"More info..."
                                               delegate:self
                                      cancelButtonTitle:@"Cancel"
                                      otherButtonTitles:@"Say Hello",nil];
[alert show];
[alert release];

  NSLog(@"HIII");
}
%end
