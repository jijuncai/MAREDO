//
//  HomeTVC.m
//  staticTableView
//
//  Created by jijuncai on 7/17/15.
//  Copyright (c) 2015 jijuncai. All rights reserved.
//

#import "HomeTVC.h"
#import "CJADScrollView.h"
#import "Masonry.h"

@interface HomeTVC ()

@property (nonatomic, strong) NSArray *imageData;
@property (nonatomic, strong) NSArray *labelData;
@property (nonatomic, strong) CJADScrollView *CJADScrollView;
@property (nonatomic, strong) CJADScrollView *CJADScrollView1;

@end

@implementation HomeTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.allowsSelection = NO;
    self.tableView.separatorColor = [UIColor clearColor];
    UIImage *image = [UIImage imageNamed:@"MAREDO.png"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
    
    UIBarButtonItem *searchBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchAction)];
    
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithTitle:@"\u2699" style:UIBarButtonItemStylePlain target:self action:@selector(showSettings)];
    
    UIFont *customFont = [UIFont fontWithName:@"Helvetica" size:24.0];
    NSDictionary *fontDictionary = @{NSFontAttributeName : customFont};
    [settingsButton setTitleTextAttributes:fontDictionary forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects:settingsButton, searchBarButtonItem, nil];
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithTitle:@"\u2630" style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    
    self.navigationItem.leftBarButtonItem = menuButton;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.imageData  = @[@"image1.jpg", @"image2.jpg", @"image3.jpg", @"image4.jpg"];
    self.labelData  = @[@"WELCOME TO MAREDO", @"GORE-TEX & MAREDO", @"TRAVEL THE WORLD WITH MAREDO", @"NEW RELEASE"];
    
    
    self.CJADScrollView = [[CJADScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 220) image:self.imageData  label:self.labelData animationDuration:5];
    self.tableView.tableHeaderView = self.CJADScrollView;
    
//    UIEdgeInsets padding = UIEdgeInsetsMake(8, 8, 8, 8);
//    
//    [self.CJADScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.tableView.tableHeaderView).with.insets(padding);
//    }];
}

- (void)viewDidAppear:(BOOL)animated{
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortraitUpsideDown];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableVie{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}

#pragma mark - help methods

-(void)searchAction{
    
}

-(void)showSettings{
    
}

-(void)showMenu{
    
}
//
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
//{
//    if ([self isKindOfClass:[UITableViewController class]])
//        return UIInterfaceOrientationPortrait;
//    else
//        return [super preferredInterfaceOrientationForPresentation];
//}
//
//- (NSUInteger)supportedInterfaceOrientations
//{
//    if ([self isKindOfClass:[UITableViewController class]])
//        return UIInterfaceOrientationMaskPortrait;
//    else
//        return [super supportedInterfaceOrientations];
//}
//
//- (BOOL)shouldAutorotate
//{
//    if ([self isKindOfClass:[UITableViewController class]])
//        return NO;
//    else
//        return [super shouldAutorotate];
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newArrive" forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
