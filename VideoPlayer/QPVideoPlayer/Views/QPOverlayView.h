
#import "QPFilmstripView.h"
#import "QPTransport.h"

@interface QPOverlayView : UIView <QPTransport>

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIButton *filmstripToggleButton;
@property (weak, nonatomic) IBOutlet UIButton *togglePlaybackButton;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *remainingTimeLabel;
@property (weak, nonatomic) IBOutlet UISlider *scrubberSlider;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UILabel *scrubbingTimeLabel;

@property (weak, nonatomic) IBOutlet QPFilmstripView *filmStripView;

@property (weak, nonatomic) id <QPTransportDelegate> delegate;

- (IBAction)toggleFilmstrip:(id)sender;
- (IBAction)toggleControls:(id)sender;
- (IBAction)togglePlayback:(UIButton *)sender;
- (IBAction)closeWindow:(id)sender;
- (void)setCurrentTime:(NSTimeInterval)time;

@end