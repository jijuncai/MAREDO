//
//  CJADScrollView.m
//  ADscrollView
//
//  Created by jijuncai on 7/10/15.
//  Copyright (c) 2015 jijuncai. All rights reserved.
//

#import "CJADScrollView.h"
#import "Masonry.h"

@interface CJADScrollView()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;


@property (nonatomic, strong) NSMutableArray *viewContents;
@property (nonatomic, strong) NSMutableArray *imageViews;
@property (nonatomic, strong) NSMutableArray *labelViews;

@property (nonatomic, strong) NSTimer *Timer;
@property (nonatomic, assign) NSTimeInterval animationDuration;

@property (nonatomic, assign) NSInteger numberOfViews;
@property (nonatomic, assign) NSInteger indexOfCurrentView;

@end

@implementation CJADScrollView

static CGFloat const widthOfPagecontrol = 80;
static CGFloat const heightOfPagecontrol = 20;

#pragma mark - custom init methods

// implement custom init for use outside the class
-(id)initWithFrame:(CGRect)frame image:(NSArray *)imagesData label:(NSArray *)labelsData animationDuration:(NSTimeInterval)animationDuration{
    
    self = [self initWithFrame:frame]; //get init of scrollView and pageControl
    [self loadImage:imagesData withLabel:labelsData]; // load data for use
    [self reloadData]; // update the data
        
    if (animationDuration > 0.0) { // set timer to loop images
        self.Timer = [NSTimer
           scheduledTimerWithTimeInterval:(self.animationDuration = animationDuration)
                                   target:self
                                 selector:@selector(animationTimerFired:)
                                 userInfo:nil
                                  repeats:YES];
    }
    
    return self;
}

// implement custom init for scrollView and pageControl
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame]; // super
    if (self) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds]; // Init ScrowView
        self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.scrollView.contentMode = UIViewContentModeCenter;
        self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.frame) * 3, CGRectGetHeight(self.scrollView.frame));
        self.scrollView.contentOffset = CGPointMake(CGRectGetWidth(self.scrollView.frame), 0);
        self.scrollView.pagingEnabled = YES;
        self.scrollView.delegate = self;
        [self addSubview:self.scrollView];
        
        
        
        self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(self.bounds.size.width - widthOfPagecontrol, self.bounds.size.height - heightOfPagecontrol, widthOfPagecontrol, heightOfPagecontrol)]; // Init PageControl
        self.pageControl.userInteractionEnabled = YES;
        self.pageControl.currentPage = 0;
        [self addSubview:self.pageControl];
        
        self.indexOfCurrentView = 0;
    }
    return self;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{ // reload data and get current page
    int contentOffsetX = scrollView.contentOffset.x;
    
    if (contentOffsetX >= (2 * CGRectGetWidth(scrollView.frame))) {
        self.indexOfCurrentView = [self getViewValidIndex:self.indexOfCurrentView + 1];
        [self reloadData];
    }
    
    if (contentOffsetX <= 0) {
        self.indexOfCurrentView = [self getViewValidIndex:self.indexOfCurrentView - 1];
        [self reloadData];
    }
    
    self.pageControl.currentPage = self.indexOfCurrentView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [scrollView setContentOffset:CGPointMake(CGRectGetWidth(scrollView.frame), 0)];
}

// reset the timer when manual scroll
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [self resumeTimerAfterTimeInterval:self.animationDuration];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self pauseTimer];
}

#pragma mark - private methods

- (void)reloadData{ // reload data in every scroll
    if (self.scrollView.subviews.count != 0) { // remove all subviews of scrollview
        [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }

    [self updateDataOfScrollview]; // update all data in the contentViews
    
    for (int i = 0; i < 3; i++) { // update all frames of contentViews and add in scrollView
        UIView *view = [self.viewContents objectAtIndex:i];
        CGRect contentRect = view.frame;
        contentRect.origin = CGPointMake(CGRectGetWidth(self.scrollView.frame) * i, 0);
        view.frame = contentRect;
        //view.contentMode = UIViewContentModeScaleAspectFill;
        [self.scrollView addSubview:view];
        
    }
    // reset contentOffset to the second page
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width, 0)];
    
    self.pageControl.numberOfPages = self.numberOfViews; // set the #pages of pageControl
}

- (void)updateDataOfScrollview{ // update all data in the contentViews
    NSInteger frontIndex = [self getViewValidIndex:self.indexOfCurrentView - 1];
    NSInteger backIndex = [self getViewValidIndex:self.indexOfCurrentView + 1];
    
    if (self.viewContents == nil) {
        self.viewContents = [NSMutableArray array];
    }
    [self.viewContents removeAllObjects];
    
    if (self.imageViews) {
        [self.viewContents addObject:self.imageViews[frontIndex]];
        [self.viewContents addObject:self.imageViews[self.indexOfCurrentView]];
        [self.viewContents addObject:self.imageViews[backIndex]];
    }
}

- (NSInteger)getViewValidIndex:(NSInteger) NextIndex{ // update the index of view
    if(NextIndex == -1) {
        return self.numberOfViews - 1;
    } else if (NextIndex == self.numberOfViews) {
        return 0;
    } else {
        return NextIndex;
    }
}

- (void)loadImage:(NSArray *)imagesData withLabel:(NSArray *)labelsData{ // load data for use
    self.imageViews = [NSMutableArray array]; // of images
    self.labelViews = [NSMutableArray array]; // of labels
    
    for (int i = 0; i < [imagesData count]; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))]; // create image
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.image = [UIImage imageNamed:imagesData[i]];
        imageView.userInteractionEnabled = YES;
        //imageView.contentMode = UIViewContentModeScaleAspectFill;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handTap:)];
        [imageView addGestureRecognizer:tapGesture];
        
        UIView *barView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 23, self.bounds.size.width, 23)];
        barView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.15];
        [imageView addSubview:barView];

        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, imageView.frame.size.height - 23, 250, heightOfPagecontrol)]; // create label
        label.text = labelsData[i];
        [label setFont:[UIFont fontWithName:@"HelveticaNeue" size:14]];
        label.textColor = [UIColor whiteColor];
        [imageView addSubview:label];
        
        
        [self.imageViews addObject:imageView]; // add to imageViews
    }
    
    
    self.numberOfViews = [self.imageViews count]; // get the number of total views
}


- (void)animationTimerFired:(NSTimer *)timer{ // ainimate scrollview paging
    CGPoint newOffset = CGPointMake(self.scrollView.contentOffset.x + CGRectGetWidth(self.scrollView.frame), self.scrollView.contentOffset.y);
    [self.scrollView setContentOffset:newOffset animated:YES];
}

- (void)pauseTimer{ // pause the timer
    if (![self.Timer isValid]) return;
    [self.Timer setFireDate:[NSDate distantFuture]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval{ // resume the timer by interval
    if (![self.Timer isValid]) return;
    [self.Timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

- (void)handTap:(UITapGestureRecognizer *)tap{
    if (self.ADScrollViewDelegate){
        [self.ADScrollViewDelegate scrollViewDelegate:self didSelectImageView:(int)self.indexOfCurrentView];
    }
}

@end