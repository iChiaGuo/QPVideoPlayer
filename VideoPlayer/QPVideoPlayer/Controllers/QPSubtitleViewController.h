
@protocol QPSubtitleViewControllerDelegate <NSObject>
- (void)subtitleSelected:(NSString *)subtitle;
@end

@interface QPSubtitleViewController : UIViewController

- (id)initWithSubtitles:(NSArray *)subtitles;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSString *selectedSubtitle;
@property (weak, nonatomic) id<QPSubtitleViewControllerDelegate> delegate;
- (IBAction)close:(id)sender;

@end
