
#import "QPPlayerView.h"
#import "QPOverlayView.h"
#import <AVFoundation/AVFoundation.h>

@interface QPPlayerView ()
@property (strong, nonatomic) QPOverlayView *overlayView;                   // 1
@end

@implementation QPPlayerView

+ (Class)layerClass {                                                       // 2
    return [AVPlayerLayer class];
}

- (id)initWithPlayer:(AVPlayer *)player {
    self = [super initWithFrame:CGRectZero];                                // 3
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight |
                                UIViewAutoresizingFlexibleWidth;

        [(AVPlayerLayer *) [self layer] setPlayer:player];                  // 4

        [[NSBundle mainBundle] loadNibNamed:@"QPOverlayView"                // 5
                                      owner:self
                                    options:nil];
        
        [self addSubview:_overlayView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.overlayView.frame = self.bounds;
}

- (id <QPTransport>)transport {
    return self.overlayView;
}

@end
