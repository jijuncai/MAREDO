//
//  womenCVC.m
//  MAREDO
//
//  Created by jijuncai on 8/19/15.
//  Copyright (c) 2015 jijuncai. All rights reserved.
//

#import "womenCVC.h"
#import "instagramShoesInfoVC.h"
#import "shoes.h"
#import "CollectionHeaderReusableView.h"

@interface womenCVC (){
    NSArray *womenShoesImages;
    NSArray *shoesLabels;
}
@property (strong, nonatomic)NSArray *womenShoes;

@end

@implementation womenCVC

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"MAREDO.png"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
    
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    
    womenShoesImages = [NSArray arrayWithObjects: @"cimage1", @"cimage4", @"cimage6", @"cimage7",  @"cimage8", @"cimage9", @"cimage11", @"cimage14", @"cimage15", nil];
    
    shoesLabels = [NSArray arrayWithObjects:@"MareDo Free Style", @"MareDo Heels",@"MareDo Sandals", @"MareDo Flats", @"MareDo Loafers", @"MareDo Soft Style",@"MareDo Classic Style",@"MareDo Italy Style",@"MareDo China Style",nil];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    shoes *shoe2 = [shoes new];
    shoe2.name = @"MareDo Free Style";
    shoe2.shoeTimeAndRate = @"5/6/2015 ♥️2556 👍148";
    shoe2.imageName = @"cimage1";
    shoe2.shoeComment = @"Navy washed canvas sneakers with an on-trend worn look. The upper features a soft suede while the distressed rubber sole is comfortable and flexible.";
    
    shoes *shoe3 = [shoes new];
    shoe3.name = @"MareDo Free Style";
    shoe3.shoeTimeAndRate = @"5/6/2015 ♥️2556 👍148";
    shoe3.imageName = @"cimage4";
    shoe3.shoeComment = @"Navy washed canvas sneakers with an on-trend worn look. The upper features a soft suede while the distressed rubber sole is comfortable and flexible.";
    
    shoes *shoe5 = [shoes new];
    shoe5.name = @"MareDo Free Style";
    shoe5.shoeTimeAndRate = @"5/6/2015 ♥️2556 👍148";
    shoe5.imageName = @"cimage6";
    shoe5.shoeComment = @"Navy washed canvas sneakers with an on-trend worn look. The upper features a soft suede while the distressed rubber sole is comfortable and flexible.";
    
    shoes *shoe10 = [shoes new];
    shoes *shoe12 = [shoes new];
    shoes *shoe13 = [shoes new];
    shoes *shoe14 = [shoes new];
    shoes *shoe16 = [shoes new];
    shoes *shoe17 = [shoes new];
    
    
    self.womenShoes = [NSArray arrayWithObjects:shoe2,shoe3,shoe5,shoe10,shoe12,shoe13,shoe14,shoe16,shoe17,nil];
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
    return womenShoesImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *shoesImageView = (UIImageView *)[cell viewWithTag:101];
    UILabel *shoesLabel = (UILabel *)[cell viewWithTag:102];
    shoesImageView.image = [UIImage imageNamed:[womenShoesImages objectAtIndex:indexPath.row]];
    shoesLabel.text = [shoesLabels objectAtIndex:indexPath.row];
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        
        CollectionHeaderReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        
        headerView.headerTitle.text = @"WOMEN";
        
        UIImage *headerImage = [UIImage imageNamed:@"woman"];
        
        headerView.headerImage.image = headerImage;
        
        reusableview = headerView;
        
    }
    //
    //    if (kind == UICollectionElementKindSectionFooter){
    //
    //        UICollectionReusableView *footerview = [collectionView dequeueResuableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
    //
    //        reusableview = footerview;
    //
    //    }
    
    return reusableview;
    
    
    
}
#pragma mark <UICollectionViewDelegate>

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showWoman"]) {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        instagramShoesInfoVC *destViewController = [segue destinationViewController];
        destViewController.shoe = [self.womenShoes objectAtIndex:indexPath.row];
    }
    
}

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

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
