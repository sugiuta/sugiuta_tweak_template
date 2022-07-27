
#import "@@CLASSPREFIX@@RootListController.h"

@implementation @@CLASSPREFIX@@RootListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}
	return _specifiers;
}

- (instancetype)init {
    self = [super init];
    if (self) {
		UIColor *defaultColor = [UIColor colorWithRed:207/255.0 green:57/255.0 blue:31/255.0 alpha:1.0];
        HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
        appearanceSettings.tintColor = defaultColor;
        appearanceSettings.navigationBarTitleColor = [UIColor whiteColor];
        appearanceSettings.navigationBarTintColor = [UIColor whiteColor];
        appearanceSettings.navigationBarBackgroundColor = defaultColor;
        appearanceSettings.largeTitleStyle = 0;
        appearanceSettings.showsNavigationBarShadow = YES;
        appearanceSettings.tableViewCellSeparatorColor = [UIColor clearColor];
        self.hb_appearanceSettings = appearanceSettings;

        self.respringButton = [[UIBarButtonItem alloc] initWithTitle:@"Respring" style:UIBarButtonItemStylePlain target:self action:@selector(respring:)];
        self.respringButton.tintColor = [UIColor whiteColor];
        self.navigationItem.rightBarButtonItem = self.respringButton;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width*9/16)];
    self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width*9/16)];
    [[self headerImageView] setContentMode:UIViewContentModeScaleAspectFill];
    [[self headerImageView] setImage:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/@@PROJECTNAME@@.bundle/Banner.png"]];
    [[self headerImageView] setClipsToBounds:YES];
    [[self headerView] addSubview:[self headerImageView]];

    self.headerImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.headerImageView.topAnchor constraintEqualToAnchor:self.headerView.topAnchor],
        [self.headerImageView.leadingAnchor constraintEqualToAnchor:self.headerView.leadingAnchor],
        [self.headerImageView.trailingAnchor constraintEqualToAnchor:self.headerView.trailingAnchor],
        [self.headerImageView.bottomAnchor constraintEqualToAnchor:self.headerView.bottomAnchor],
    ]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    tableView.tableHeaderView = self.headerView;
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)respring:(id)sender {
    if (![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/shuffle.dylib"]) [HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=@@PROJECTNAME@@"]];
    else [HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Tweaks&path=@@PROJECTNAME@@"]];
}

/* -----------------------------------------
- (UITableViewStyle)tableViewStyle {
	if (@available(iOS 13.0, *)) return UITableViewStyleInsetGrouped;
	else return UITableViewStyleGrouped;
}
-------------------------------------------*/

@end
