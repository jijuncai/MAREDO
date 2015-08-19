//
//  instagramShoesInfoVC.h
//  staticTableView
//
//  Created by jijuncai on 7/23/15.
//  Copyright (c) 2015 jijuncai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shoes.h"

@interface instagramShoesInfoVC : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageShoe;
@property (weak, nonatomic) IBOutlet UILabel *nameOfShoe;
@property (weak, nonatomic) IBOutlet UILabel *shoeTimeRate;
@property (weak, nonatomic) IBOutlet UITextView *commentShoe;

@property (nonatomic, strong) shoes *shoe;

@end
