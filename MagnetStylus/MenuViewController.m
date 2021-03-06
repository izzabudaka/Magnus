

#import "MenuViewController.h"
#import "DrawViewController.h"

@interface MenuViewController () <UINavigationBarDelegate, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@end

@implementation MenuViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//	self.view.backgroundColor = [UIColor darkGrayColor];
	
	
	self.backButtonOut.title = @"Back";
	self.backButtonOut.tintColor = [UIColor whiteColor];
	self.menuBar.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:31.0/255.0 blue:63.0/255.0 alpha:1.0];
	[self.menuBar setBarStyle:UIBarStyleBlackTranslucent];
	
	self.nameEntry.placeholder = @"Add a mockup";
	self.nameEntry.delegate = self;
	
		self.drawingsArray = [@[] mutableCopy];
	
	self.drawings.dataSource = self;
	self.drawings.delegate = self;
	self.drawings.backgroundColor = [UIColor whiteColor];
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([filePaths count] > 0) ? [filePaths objectAtIndex:0] : nil;
    NSString *location = [basePath stringByAppendingPathComponent:@"Drawings"];
    NSLog(@"Location: %@", location);
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:location error:NULL];
    NSLog(@"files: %@", files);
    self.drawingData = [@[] mutableCopy];
    for (NSString *path in files) {
        NSLog(@"Path: %@", path);
        NSData *data = [[NSData alloc] initWithContentsOfFile:[location stringByAppendingPathComponent:path]];
        if (data) {
            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
            [self.drawingData addObject:[unarchiver decodeObjectForKey:@"drawing"]];
            [unarchiver finishDecoding];
        }
    }
    if (self.drawingData) {
        for (NSDictionary *dict in self.drawingData) {
            NSLog(@"Dict: %@", dict);
            [self.drawingsArray addObject:dict[@"title"]];
        }
    }
}

-(void)viewDidLayoutSubviews {
	[self.menuBar setFrame:CGRectMake(0,0, self.view.frame.size.width, 44)];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	[self.drawingsArray addObject:[NSString stringWithString:textField.text]];
	[self.drawings reloadData];
	textField.text = @"";
	
	[textField resignFirstResponder];
	
	return true;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.drawingsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *testcell = [tableView dequeueReusableCellWithIdentifier:@"DocumentCell"];
	
	if (testcell == nil) {
		testcell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DocumentCell"];
	}
	
	testcell.textLabel.textAlignment = NSTextAlignmentCenter;
	testcell.tag = indexPath.row;
	testcell.textLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:31.0/255.0 blue:63.0/255.0 alpha:1.0];
	testcell.textLabel.text = self.drawingsArray[indexPath.row];
	testcell.backgroundColor = [UIColor whiteColor];
	testcell.selectionStyle = UITableViewCellSelectionStyleGray;
	
	return testcell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	DrawViewController *myVC = (DrawViewController *)[storyboard instantiateViewControllerWithIdentifier:@"draw"];
    myVC.title = [[[tableView cellForRowAtIndexPath:indexPath] textLabel] text];
    myVC.paths = [@[] mutableCopy];
    for (NSDictionary *dict in self.drawingData) {
        if (dict[@"title"] == myVC.title) {
            myVC.paths = dict[@"paths"];
        }
    }
	myVC.drawingIdentifier = self.drawingsArray[indexPath.row];
	[self presentViewController:myVC animated:YES completion:nil];
}

- (void)tableView: (UITableView *)tableView commitEditingStyle: (UITableViewCellEditingStyle)editingStyle forRowAtIndexPath: (NSIndexPath *)indexPath {
	if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSString *title = [self.drawingData objectAtIndex:indexPath.row][@"title"];
		[self.drawingsArray removeObjectAtIndex:indexPath.row];
		[self.drawings deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *basePath = ([filePaths count] > 0) ? [filePaths objectAtIndex:0] : nil;
        NSString *location = [basePath stringByAppendingPathComponent:@"Drawings"];
        NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:location error:NULL];
        for (NSString *path in files) {
            NSLog(@"location: %@, path: %@, title: %@", location, path, title);
            if ([path isEqualToString:title]) {
                [[NSFileManager defaultManager] removeItemAtPath:[location stringByAppendingPathComponent:path] error:nil];
            }
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

- (IBAction)backButtonAct:(id)sender {
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	UIViewController *myVC = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"home"];
	[self presentViewController:myVC animated:YES completion:nil];
}
/*
- (IBAction)nDrawingButtonAct:(id)sender {
	[self.drawingsArray addObject:[NSString stringWithFormat:@"Drawing #%lu", (self.drawingsArray.count+1)]];
	[self.drawings reloadData];
}
 */
@end
