#import "Tweak.h"

//prefs
BOOL enabled = NO;

%group Tweak
%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)application {
    %orig;
    UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"@@FULLPACKAGENAME@@"
		message:@"Thank you for installing @@FULLPACKAGENAME@@"
		delegate:nil
		cancelButtonTitle:@"OK"
		otherButtonTitles:nil];
	[error show];
}
%end
%end

%ctor {
    HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"@@PACKAGENAME@@"];
    [preferences registerBool:&enabled default:NO forKey:@"kEnabled"];
    if(enabled) %init(Tweak);
}
