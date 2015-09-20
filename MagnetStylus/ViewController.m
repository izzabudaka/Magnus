//
//  ViewController.m
//  MagnetStylus
//
//  Created by Izz Abudaka on 20/09/2015.
//  Copyright (c) 2015 PennAppsTeam2015. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
//    self.normalImage = [[UIImage alloc] init];
//    self.image1.image = self.normalImage;
    NSLog(@"yo");
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    [Wrapper processImage:self.normalImage withVC:self];
    
//    self.image2.image = result;
//    self.image2.frame = self.view.frame;
//    [self.view addSubview:self.image2];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInView:self.view];
        for (UIView *view in self.view.subviews) {
            if (CGRectContainsPoint(view.frame, location)) {
                self.selectedView = view;
            }
        }
    }
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInView:self.view];
        self.selectedView.center = location;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
