//
//  CJADScrollView.h
//  ADscrollView
//
//  Created by jijuncai on 7/10/15.
//  Copyright (c) 2015 jijuncai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CJADScrollViewDelegate;

@interface CJADScrollView : UIView

@property (nonatomic, assign) id ADScrollViewDelegate;

- (id)initWithFrame:(CGRect)frame image:(NSArray *)imagesData label:(NSArray *)labelsData animationDuration:(NSTimeInterval)animationDuration; // public method

@end

@protocol CJADScrollViewDelegate <NSObject>

@optional
- (void)scrollViewDelegate:(CJADScrollView *)CJADScrollView didSelectImageView:(int)index;

@end
