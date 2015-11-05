//
//  LoginViewController.m
//  TutorialBase
//
//  Created by Antonio MG on 6/23/12.
//  Copyright (c) 2012 AMG. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()
@property (nonatomic, strong) IBOutlet UITextField *userTextField;
@property (nonatomic, strong) IBOutlet UITextField *passwordTextField;
@end

@implementation LoginViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    UIBarButtonItem *searchBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchAction)];
    
//    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithTitle:@"\u2699" style:UIBarButtonItemStylePlain target:self action:@selector(showSettings)];
//    
//    UIFont *customFont = [UIFont fontWithName:@"Helvetica" size:24.0];
//    NSDictionary *fontDictionary = @{NSFontAttributeName : customFont};
//    [settingsButton setTitleTextAttributes:fontDictionary forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects: searchBarButtonItem, nil];
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithTitle:@"\u2630" style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    
    self.navigationItem.leftBarButtonItem = menuButton;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

#pragma mark - Private methods

-(IBAction)logInPressed:(id)sender
{
    [PFUser logInWithUsernameInBackground:self.userTextField.text password:self.passwordTextField.text block:^(PFUser *user, NSError *error) {
        if (user) {
            [self performSegueWithIdentifier:@"LoginSuccesful" sender:self];
        } else {
            [[[UIAlertView alloc] initWithTitle:@"Error" message:[error userInfo][@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
    }];
}

#pragma mark - help methods

-(void)searchAction{
    
}

-(void)showSettings{
    
}

-(void)showMenu{
    
}


@end
