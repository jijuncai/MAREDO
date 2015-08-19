//
//  LandingPageVC.m
//  MAREDO
//
//  Created by jijuncai on 8/18/15.
//  Copyright (c) 2015 jijuncai. All rights reserved.
//

#import "LandingPageVC.h"

@interface LandingPageVC () <UIScrollViewDelegate>

#define DURATION 0.7f
@property (nonatomic, assign) int subtype;

#define imgCount 3
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) UIButton *skipButton;

@end

@implementation LandingPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor clearColor];
    
    CGFloat screenWidth = self.view.bounds.size.width;
    CGFloat screenHeight = self.view.bounds.size.height;
    
    // Scroll View
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.backgroundColor=[UIColor clearColor];
    self.scrollView.delegate=self;
    self.scrollView.pagingEnabled=YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width*3, self.scrollView.frame.size.height)];
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    
    [self.view addSubview:self.scrollView];
    
    // page control
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 480, screenWidth, 36)];
    self.pageControl.numberOfPages = imgCount;
    self.pageControl.currentPage = 0;
    [self.view addSubview:self.pageControl];
    
    CGFloat x=0; // add images, labels and button to scrollView
    for(int i = 1; i < 4; i++){
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(x+0, 0, screenWidth, screenHeight)];
        NSString *imageName = [NSString stringWithFormat:@"image%d.pgn",i];
        [image setImage:[UIImage imageNamed:imageName]];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, 150, screenWidth, 40)];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:25];
        label.adjustsFontSizeToFitWidth = YES;
        
        switch (i) {
            case 1:
                label.text = @"Welcome to MAREDO";
                break;
            case 2:
                label.text = @"Travel with MAREDO";
                break;
            case 3:
                label.text = @"Design for the World";
                break;
        }
        
        // add skip button for every page
        self.skipButton = [[UIButton alloc] initWithFrame:CGRectMake(x, 520, screenWidth, 20)];
        [self.skipButton setTitle:@"Skip" forState:UIControlStateNormal];
        [self.skipButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.skipButton addTarget:self action:@selector(jumpMainControllerWithAnimation) forControlEvents:UIControlEventTouchUpInside];
        
        [self.scrollView addSubview:image];
        [self.scrollView addSubview:label];
        [self.scrollView addSubview:self.skipButton];
        
        x += screenWidth;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat pageWidth = self.scrollView.frame.size.width;
    float fractionalPage = self.scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page;
    
    
}

- (BOOL)shouldAutorotate { return NO; } // prevent auto rotate

- (NSUInteger)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskPortrait);
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    // position current location
    int currentNum = scrollView.contentOffset.x / scrollView.frame.size.width;
    //NSLog(@"%d",currentNum);
    if (currentNum == imgCount - 1) {
        [self jumpMainControllerWithAnimation];
    }
}

- (void)jumpMainControllerWithAnimation{
    [UIView animateWithDuration:1.5 animations:^{
        _scrollView.alpha=0;//let scrollview disappear
        
    }completion:^(BOOL finished) {
        [_scrollView  removeFromSuperview];// remove scrollview
        [self jumpMainController];//enter main view
        
    } ];
}

- (void)jumpMainController{
    //NSLog(@"enter the main view");
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.view.window.rootViewController = storyBoard.instantiateInitialViewController;
}

#pragma CATransition animation
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view{
    CATransition *animation = [CATransition animation];
    animation.duration = DURATION;
    animation.type = type;
    if (subtype != nil) {
        animation.subtype = subtype;
    }
    
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    [view.layer addAnimation:animation forKey:@"animation"];
}



#pragma UIView animation
- (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition{
    [UIView animateWithDuration:DURATION animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}



#pragma add background image
-(void)addBgImageWithImageName:(NSString *) imageName{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
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
