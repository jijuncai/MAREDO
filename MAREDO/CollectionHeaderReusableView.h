//
//  CollectionHeaderReusableView.h
//  staticTableView
//
//  Created by jijuncai on 7/27/15.
//  Copyright (c) 2015 jijuncai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionHeaderReusableView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *headerTitle;

@end
