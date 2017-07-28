
#import "QPPlaybackViewController.h"
#import "QPPlayerViewController.h"
#import "UIAlertView+QPAdditions.h"

#define YOUTUBE_URL @"http://www.youtube.com/watch?v=6dNryy5elc8"

#define LOCAL_SEGUE        @"localSegue"
#define STREAMING_SEGUE @"streamingSegue"

@interface QPPlaybackViewController ()
@property (nonatomic, strong) NSURL *localURL;
@property (nonatomic, strong) NSURL *streamingURL;
@end

@implementation QPPlaybackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.localURL = [[NSBundle mainBundle] URLForResource:@"hubblecast" withExtension:@"m4v"];

    self.streamingURL = [NSURL URLWithString:@"http://d.pan.iqiyi.com/external/Ku1z59eEIyw0i7Kx1989ehIvtWY-N6OWWxchYgNGrovF6XlH7Aj9GbVjiGDeHqXTHRR06ugLHLk6a7LIcFf2dBRxlbU4k_5s6p91UYIRWxj73TnwX5hVNMlSKhqpGjqJPsbv7NTRxNigQg4CLUZwZAgTXmbc4DZBYd9kx5ukLU8"];
    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:LOCAL_SEGUE] && !self.localURL) {
        return [self alertError];
    } else if ([identifier isEqualToString:STREAMING_SEGUE] && !self.streamingURL) {
        return [self alertError];
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSURL *url = [segue.identifier isEqualToString:LOCAL_SEGUE] ? self.localURL : self.streamingURL;
    QPPlayerViewController *controller = [segue destinationViewController];
    controller.assetURL = url;
}

- (BOOL)alertError {
    [UIAlertView showAlertWithTitle:@"Asset Unavailable"
                            message:@"The requested asset could not be loaded."];
    return NO;
}

@end
