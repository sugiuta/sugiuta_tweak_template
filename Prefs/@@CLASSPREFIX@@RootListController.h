#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListController.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBRespringController.h>

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@interface @@CLASSPREFIX@@RootListController : HBRootListController
@property(nonatomic, retain)UIView *headerView;
@property(nonatomic, retain)UIImageView *headerImageView;
@property (nonatomic, retain) UIBarButtonItem *respringButton;
- (void)respring:(id)sender;
@end
