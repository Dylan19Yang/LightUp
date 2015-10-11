//
//  searchNameViewController.m
//  LightUp
//
//  Created by YangYuxin on 15/10/11.
//  Copyright © 2015年 Atlas19. All rights reserved.
//

#import "searchNameViewController.h"
#import "API.h"
#import "User.h"

@interface searchNameViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation searchNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)search:(id)sender {
    UIAlertView *waitView=[[UIAlertView alloc] initWithTitle:@"请稍候" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [waitView show];
    [[API sharedAPI] searchUserWIthUserId:[User sharedInstance].userId personName:self.nameTextField.text andBLock:^(id responseObject, NSError *error) {
        [waitView dismissWithClickedButtonIndex:0 animated:YES];
        if (error) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"网络异常" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
        else{
            
        }

    }];
}
@end
