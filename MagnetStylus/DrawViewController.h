

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SmoothedBIView.h"
#import "Wrapper.h"

@interface DrawViewController : UIViewController 

@property (strong, nonatomic) IBOutlet UILabel *menuTitle;
@property (strong, nonatomic) IBOutlet UIButton *backButtonOut;
@property (strong, nonatomic) IBOutlet UIButton *saveButtonOut;
@property (strong,nonatomic) NSString *drawingIdentifier;

@property (strong, nonatomic) UIImage *snapshotImage;

//HUB
@property (strong, nonatomic) IBOutlet UILabel *mag;
@property (strong, nonatomic) IBOutlet UILabel *angle;
@property (strong, nonatomic) IBOutlet UILabel *x;
@property (strong, nonatomic) IBOutlet UILabel *y;



- (void)saveDrawing;
@property NSMutableArray *paths;


@end
