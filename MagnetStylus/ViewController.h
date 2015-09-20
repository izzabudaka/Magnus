//
//  ViewController.h
//  MagnetStylus
//
//  Created by Izz Abudaka on 20/09/2015.
//  Copyright (c) 2015 PennAppsTeam2015. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Wrapper.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;

@property (strong, nonatomic) UIImage *normalImage;
@property (strong, nonatomic) UIImage *processedImage;

@property (strong, nonatomic) UIView *selectedView;

@end
