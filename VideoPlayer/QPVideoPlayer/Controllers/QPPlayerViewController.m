
#import "QPPlayerViewController.h"
#import "QPPlayerController.h"

@interface QPPlayerViewController ()
@property (strong, nonatomic) QPPlayerController *controller;
@end

@implementation QPPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.controller = [[QPPlayerController alloc] initWithURL:self.assetURL];
    UIView *playerView = self.controller.view;
    playerView.frame = self.view.frame;
    [self.view addSubview:playerView];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
