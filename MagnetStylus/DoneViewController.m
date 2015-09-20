

#import "DoneViewController.h"
#import "MenuViewController.h"

@interface DoneViewController ()

@end

@implementation DoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	/*only supports passing a single image
	NSArray* images = @[
						@{@"url": UIImagePNGRepresentation(self.snapshotImage), @"user_generated" : @"true" }];
	
	id<FBOpenGraphAction> action = (id<FBOpenGraphAction>)[FBGraphObject graphObject];
	[action setObject:@"https://example.com/cooking-app/meal/Lamb-Vindaloo.html" forKey:@"meal"];
	[action setObject:images forKey:@"image"];
	
	[FBDialogs presentShareDialogWithOpenGraphAction:action
										  actionType:@"fbsdktoolkit:cook"
								 previewPropertyName:@"meal"
											 handler:^(FBAppCall *call, NSDictionary *results, NSError *error) {
												 if(error) {
													 NSLog(@"Error: %@", error.description);
												 } else {
													 NSLog(@"Success!");
												 }
											 }];*/
	
//	self.view.backgroundColor = [UIColor darkGrayColor];
	
	self.backOut.titleLabel.text = @"Back";
	[self.backOut setTitleColor: [UIColor colorWithRed:0.0/255.0 green:31.0/255.0 blue:63.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    self.homeOut.titleLabel.text = @"MENU";
    [self.homeOut setTitleColor: [UIColor colorWithRed:0.0/255.0 green:31.0/255.0 blue:63.0/255.0 alpha:1.0] forState:UIControlStateNormal];
	self.process.titleLabel.text = @"PROCESS";
	[self.process setTitleColor: [UIColor colorWithRed:0.0/255.0 green:31.0/255.0 blue:63.0/255.0 alpha:1.0] forState:UIControlStateNormal];
	self.doneLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:30];
	self.doneLabel.text = [@"Done with " stringByAppendingString: [self.drawingIdentifier stringByAppendingString:@"!"]];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-200, self.view.frame.size.height-80, 200, 80)];
    [button.titleLabel setText:@"Process"];
    [button addTarget:self action:@selector(processPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.snapshotImage.size.width*0.6, self.snapshotImage.size.height*0.6)];
    imageView.center = self.view.center;
    imageView.image = self.snapshotImage;
    [self.view addSubview:imageView];
    
    
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

- (IBAction)backPressed {
	
}

- (IBAction)homePressed {
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	MenuViewController *myVC = (MenuViewController *)[storyboard instantiateViewControllerWithIdentifier:@"menu"];
	[self presentViewController:myVC animated:YES completion:nil];
}
- (IBAction)processPressed {
    NSLog(@"processing");
//    [Wrapper processImage: self.snapshotImage withVC:self];
    ViewController *lmao = [[ViewController alloc] init];
    lmao.normalImage = self.snapshotImage;
    [self presentViewController:lmao animated:YES completion:nil];
    
}
- (IBAction)processPressed:(id)sender {
}
@end
