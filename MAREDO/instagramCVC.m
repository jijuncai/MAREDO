//
//  instagramCVC.m
//  staticTableView
//
//  Created by jijuncai on 7/22/15.
//  Copyright (c) 2015 jijuncai. All rights reserved.
//

#import "instagramCVC.h"
#import "instagramShoesInfoVC.h"
#import "shoes.h"

@interface instagramCVC (){
    
    NSArray *shoesImages;
    
  
}
@property (strong, nonatomic)NSArray *shoes;


@end

@implementation instagramCVC

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *searchBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchAction)];
//    
//    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithTitle:@"\u2699" style:UIBarButtonItemStylePlain target:self action:@selector(showSettings)];
//    
//    UIFont *customFont = [UIFont fontWithName:@"Helvetica" size:24.0];
//    NSDictionary *fontDictionary = @{NSFontAttributeName : customFont};
//    [settingsButton setTitleTextAttributes:fontDictionary forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects: searchBarButtonItem, nil];
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithTitle:@"\u2630" style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    
    self.navigationItem.leftBarButtonItem = menuButton;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    shoesImages = [NSArray arrayWithObjects:@"cimage1", @"cimage2", @"cimage3", @"cimage4", @"cimage5",  @"cimage6", @"cimage7", @"cimage8", @"cimage9", @"cimage10", @"cimage11", @"cimage12", @"cimage13", @"cimage14", @"cimage15", @"cimage16", @"cimage17",@"cimage3", nil];
    
    
    
    // Do any additional setup after loading the view.
    shoes *shoe1 = [shoes new];
    shoe1.name = @"MareDo Free Style";
    shoe1.shoeTimeAndRate = @"5/6/2015 ♥️2556 👍148";
    shoe1.imageName = @"cimage1";
    shoe1.shoeComment = @"Navy washed canvas sneakers with an on-trend worn look. The upper features a soft suede while the distressed rubber sole is comfortable and flexible.";
    
    shoes *shoe2 = [shoes new];
    shoe2.name = @"MareDo Free Style";
    shoe2.shoeTimeAndRate = @"5/6/2015 ♥️2556 👍148";
    shoe2.imageName = @"cimage1";
    shoe2.shoeComment = @"Navy washed canvas sneakers with an on-trend worn look. The upper features a soft suede while the distressed rubber sole is comfortable and flexible.";
    
    shoes *shoe3 = [shoes new];
    shoe3.name = @"MareDo Free Style";
    shoe3.shoeTimeAndRate = @"5/6/2015 ♥️2556 👍148";
    shoe3.imageName = @"cimage1";
    shoe3.shoeComment = @"Navy washed canvas sneakers with an on-trend worn look. The upper features a soft suede while the distressed rubber sole is comfortable and flexible.";
    
    shoes *shoe4 = [shoes new];
    shoe4.name = @"MareDo Free Style";
    shoe4.shoeTimeAndRate = @"5/6/2015 ♥️2556 👍148";
    shoe4.imageName = @"cimage1";
    shoe4.shoeComment = @"Navy washed canvas sneakers with an on-trend worn look. The upper features a soft suede while the distressed rubber sole is comfortable and flexible.";
    
    shoes *shoe5 = [shoes new];
    shoe5.name = @"MareDo Free Style";
    shoe5.shoeTimeAndRate = @"5/6/2015 ♥️2556 👍148";
    shoe5.imageName = @"cimage1";
    shoe5.shoeComment = @"Navy washed canvas sneakers with an on-trend worn look. The upper features a soft suede while the distressed rubber sole is comfortable and flexible.";
    
    shoes *shoe6 = [shoes new];
    shoes *shoe7 = [shoes new];
    shoes *shoe8 = [shoes new];
    shoes *shoe9 = [shoes new];
    shoes *shoe10 = [shoes new];
    shoes *shoe11 = [shoes new];
    shoes *shoe12 = [shoes new];
    shoes *shoe13 = [shoes new];
    shoes *shoe14 = [shoes new];
    shoes *shoe15 = [shoes new];
    shoes *shoe16 = [shoes new];
    shoes *shoe17 = [shoes new];
    shoes *shoe18 = [shoes new];
    
    
    self.shoes = [NSArray arrayWithObjects:shoe1,shoe2,shoe3,shoe4,shoe5,shoe6,shoe7,shoe8,shoe9,shoe10,shoe11,shoe12,shoe13,shoe14, shoe15,shoe16,shoe17,shoe18,nil];
    
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return shoesImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    UIImageView *shoesImageView = (UIImageView *)[cell viewWithTag:100];
    shoesImageView.image = [UIImage imageNamed:[shoesImages objectAtIndex:indexPath.row]];
    
    
    //cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame"]];
    
    return cell;
}

//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    [self performSegueWithIdentifier:@"showShoeDetail" sender:self];
//}

#pragma mark - help methods

-(void)searchAction{
    
}

-(void)showSettings{
    
}

-(void)showMenu{
    
}

#pragma mark <UICollectionViewDelegate>

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showShoeDetail"]) {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        instagramShoesInfoVC *destViewController = [segue destinationViewController];
        destViewController.shoe = [self.shoes objectAtIndex:indexPath.row];
    }
    
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/


// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
