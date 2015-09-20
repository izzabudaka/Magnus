

#import "HomeViewController.h"

@interface HomeViewController ()

@property (strong, nonatomic) UITapGestureRecognizer *tap;

@end

@implementation HomeViewController

-(void)awakeFromNib {
	[super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//	self.view.backgroundColor = [UIColor darkGrayColor];
	
	// Do any additional setup after loading the view.
	self.titleLabel = [[UILabel alloc] init];
	[self.titleLabel setFrame: CGRectMake(CGRectGetMidX(self.view.frame)-250, CGRectGetMidY(self.view.frame)-80, 500, 100)];
	[self.titleLabel setTextAlignment:NSTextAlignmentCenter];
	[self.titleLabel setFont: [UIFont fontWithName:@"AvenirNext-UltraLight" size:70]];
	[self.titleLabel setTextColor: [UIColor darkTextColor]];
	[self.titleLabel setText: @"Magnus"];
	[self.view addSubview:self.titleLabel];
    
	self.startButton = [[UILabel alloc] init];
	[self.startButton setFrame: CGRectMake(CGRectGetMidX(self.view.frame)-250, CGRectGetMidY(self.view.frame), 500, 100)];
	[self.startButton setTextAlignment:NSTextAlignmentCenter];
	[self.startButton setFont: [UIFont fontWithName:@"AvenirNext-Regular" size:20]];
	[self.startButton setTextColor: [UIColor colorWithRed:0.0/255.0 green:31.0/255.0 blue:63.0/255.0 alpha:1.0]];
	[self.startButton setText: @"Tap to begin"];
	[self.view addSubview:self.startButton];
	
	[self.view addGestureRecognizer:self.tap];
}

-(void)tapDetected {
	
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	
	UIViewController *myVC = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"menu"];
	
	[self presentViewController:myVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITapGestureRecognizer *)tap {
    if (_tap == nil) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
    }
    return _tap;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)startPressed {
}
@end
