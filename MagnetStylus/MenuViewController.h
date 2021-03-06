

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController <UINavigationBarDelegate, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UINavigationBar *menuBar;
@property (strong, nonatomic) IBOutlet UINavigationItem *menuTitle;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButtonOut;
- (IBAction)backButtonAct:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *drawings;
@property (strong, nonatomic) NSMutableArray *drawingsArray;
@property (strong, nonatomic) IBOutlet UITextField *nameEntry;
@property (strong, nonatomic) NSMutableArray *drawingData;
@end
