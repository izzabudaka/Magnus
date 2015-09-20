

#import <UIKit/UIKit.h>
#import "Wrapper.h"
#import "ViewController.h"

@interface DoneViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *doneLabel;
@property (strong, nonatomic) IBOutlet UIButton *backOut;
@property (strong, nonatomic) IBOutlet UIButton *homeOut;
- (IBAction)backPressed;
//- (IBAction)homePressed;
@property (weak, nonatomic) IBOutlet UIButton *process;
- (IBAction)processPressed:(id)sender;

@property (nonatomic, strong) UIImage *snapshotImage;

@property (strong, nonatomic) NSString *drawingIdentifier;

@end
