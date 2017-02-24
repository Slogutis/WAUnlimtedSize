//This Tweak under GPL license you can modify and compile it for yourself or jailbreak comuunicate //



%hook WAVideoTranscoderDescriptor
-(bool)requiresFileSizeReduction {
  return FALSE;
  }
  %end
  
  // Here you can change a file size //
  
%hook WAVideoTranscoderDescriptor
-(unsigned long long)maximumFileSize {
  return 1000;
  }
  %end
  
%hook WAVideoTranscoderDescriptor
-(void)setMaximumFileSize:(unsigned long long)arg1{
  arg1 = 1000;
  %orig(arg1);
  }
  %end
  
  // That's All :D //


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
