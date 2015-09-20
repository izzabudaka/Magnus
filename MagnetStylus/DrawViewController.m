

#import "DrawViewController.h"
#import "DoneViewController.h"

@interface DrawViewController ()

@end

@implementation DrawViewController

- (void)viewDidLoad {
	[super viewDidLoad];
//	self.view.backgroundColor = [UIColor darkGrayColor];
    // Do any additional setup after loading the view.
    if (self.paths) {
        for (UIView *view in [self.view subviews]) {
            if ([view isKindOfClass:[SmoothedBIView class]]) {
                [(SmoothedBIView *)view initalSetupWithPaths:self.paths];
            }
        }
    }
	self.backButtonOut.titleLabel.text = @"Back";
	[self.backButtonOut setTitleColor: [UIColor colorWithRed:0.0/255.0 green:31.0/255.0 blue:63.0/255.0 alpha:1.0] forState:UIControlStateNormal];
	self.saveButtonOut.titleLabel.text = @"Save";
	[self.saveButtonOut setTitleColor: [UIColor colorWithRed:0.0/255.0 green:31.0/255.0 blue:63.0/255.0 alpha:1.0] forState:UIControlStateNormal];
	self.menuTitle.font = [UIFont fontWithName:@"Avenir-Heavy" size:30];
	self.menuTitle.text = [self.title uppercaseString];
	
    
//    [NSTimer scheduledTimerWithTimeInterval:2.0
//                                     target:self
//                                   selector:@selector( every2sec)
//                                   userInfo:nil
//                                    repeats:YES];

	
	
}

+ (UIImage *) imageWithView:(UIView *)view
{
	UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
	[view.layer renderInContext:UIGraphicsGetCurrentContext()];
	
	UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	return img;
}

- (void) every2sec {
    NSLog(@"Running every2sec");
    [self takeImage];
    UIImage *img = self.snapshotImage;
    [Wrapper processImage: img withVC:self];
}

- (IBAction)done:(id)sender {
	[self saveDrawing];
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	DoneViewController *myVC = (DoneViewController *)[storyboard instantiateViewControllerWithIdentifier:@"done"];
    [self takeImage];
	myVC.drawingIdentifier = self.drawingIdentifier;
	myVC.snapshotImage = self.snapshotImage;
	[self presentViewController:myVC animated:YES completion:nil];
}

- (void)takeImage {
    [self.menuTitle removeFromSuperview];
    [self.backButtonOut removeFromSuperview];
    [self.saveButtonOut removeFromSuperview];
    
    for (UIView *view in [self.view subviews]) {
        if ([view isKindOfClass:[SmoothedBIView class]]) {
            UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0.0f);
            CGContextRef context = UIGraphicsGetCurrentContext();
            [view.layer renderInContext:context];
            self.snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
    }
    self.menuTitle.alpha = 1;
    self.backButtonOut.alpha = 1;
    self.saveButtonOut.alpha = 1;

}

- (void)saveDrawing {
    for (UIView *view in [self.view subviews]) {
        if ([view isKindOfClass:[SmoothedBIView class]]) {
            [(SmoothedBIView *)view saveWithTitle:self.title];
        }
    }
}

- (IBAction)undo:(id)sender {
    for (UIView *view in [self.view subviews]) {
        if ([view isKindOfClass:[SmoothedBIView class]]) {
            [(SmoothedBIView *)view undo];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)backButtonAct:(id)sender {
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	UIViewController *myVC = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"menu"];
	[self presentViewController:myVC animated:YES completion:nil];
}


@end