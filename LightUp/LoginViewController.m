//
//  LoginViewController.m
//  LightUp
//
//  Created by YangYuxin on 15/9/24.
//  Copyright © 2015年 Atlas19. All rights reserved.
//

#import "LoginViewController.h"
#import "HttpClient.h"
#import "DetailTabBarViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)signIn:(id)sender {
    //[[HttpClient sharedClient] uploadPictureAPI:@"http://192.168.1.109:9993/test.php" params:nil image:[UIImage imageNamed:@"apple"] imageName:@"food_pic_file" fileName:@"1.png" andBlock:nil];
    DetailTabBarViewController *tabBarViewController = [[DetailTabBarViewController alloc]initWithNibName:@"DetailTabBarController" bundle:nil];
    [self presentViewController:tabBarViewController animated:YES completion:nil];
    
}

@end
