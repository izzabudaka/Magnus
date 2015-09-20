
#import <UIKit/UIKit.h>

@interface SmoothedBIView : UIView

- (void)undo;
- (void)saveWithTitle:(NSString *)title;
- (void)initalSetupWithPaths:(NSMutableArray*)initPaths;
- (void) every2sec;
- (UIImage *)getImage;

@end
