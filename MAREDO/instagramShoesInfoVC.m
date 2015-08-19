//
//  instagramShoesInfoVC.m
//  staticTableView
//
//  Created by jijuncai on 7/23/15.
//  Copyright (c) 2015 jijuncai. All rights reserved.
//

#import "instagramShoesInfoVC.h"


@interface instagramShoesInfoVC ()




@end

@implementation instagramShoesInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
        
    self.nameOfShoe.text = self.shoe.name;
    self.shoeTimeRate.text = self.shoe.shoeTimeAndRate;
    self.commentShoe.text = self.shoe.shoeComment;
    self.imageShoe.image = [UIImage imageNamed:self.shoe.imageName];
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

@end
