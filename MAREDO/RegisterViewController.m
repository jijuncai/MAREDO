//
//  RegisterViewController.m
//  TutorialBase
//
//  Created by Antonio MG on 6/27/12.
//  Copyright (c) 2012 AMG. All rights reserved.
//

#import "RegisterViewController.h"
#import <Parse/Parse.h>

@interface RegisterViewController ()
@property (nonatomic, strong) IBOutlet UITextField *userRegisterTextField;
@property (nonatomic, strong) IBOutlet UITextField *passwordRegisterTextField;
@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {

    }
    
    return self;
}

#pragma mark - Private methods

-(IBAction)signUpUserPressed:(id)sender
{
    //1
    PFUser *user = [PFUser user];
    //2
    user.username = self.userRegisterTextField.text;
    user.password = self.passwordRegisterTextField.text;
    //3
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [self performSegueWithIdentifier:@"SignupSuccesful" sender:self];
        } else {
            [[[UIAlertView alloc] initWithTitle:@"Error" message:[error userInfo][@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
    }];
}

@end
