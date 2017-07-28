
#import "QPTransport.h"

@class AVPlayer;

@interface QPPlayerView : UIView

- (id)initWithPlayer:(AVPlayer *)player;

@property (nonatomic, readonly) id <QPTransport> transport;

@end
