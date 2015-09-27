//
//  LoginViewController.m
//  LightUp
//
//  Created by YangYuxin on 15/9/24.
//  Copyright © 2015年 Atlas19. All rights reserved.
//

#import "LoginViewController.h"
#import "DetailTabBarViewController.h"
#import "API.h"

@interface LoginViewController ()

@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.userPassWordTextField.delegate = self;
    self.userPhoneNumberTextField.delegate = self;
    // Do any additional setup after loading the view.
}

- (IBAction)signIn:(id)sender {
    if(self.userPhoneNumberTextField.text.length <= 0)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"手机号名不得为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if(self.userPassWordTextField.text.length <= 0)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"密码长度必须大于6位" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        UIAlertView *waitAlert = [[UIAlertView alloc]initWithTitle:@"请稍候" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [waitAlert show];
        
        [[API sharedAPI] loginWithAccount:self.userPhoneNumberTextField.text password:self.userPassWordTextField.text andBLock:^(id responseObject, NSError *error) {
            
            [waitAlert dismissWithClickedButtonIndex:0 animated:YES];
            NSDictionary *dic=(NSDictionary*)responseObject;
            if (error) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"网络异常" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
            }
            else if ([dic[@"state"] isEqualToString:@"00"]) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"手机号不存在" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
            }
            else if ([dic[@"state"] isEqualToString:@"10"]) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"密码错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
            }
            else if ([dic[@"state"] isEqualToString:@"11"]) {
                DetailTabBarViewController *tabBarViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailTabBarController"];
                [self presentViewController:tabBarViewController animated:YES completion:nil];
            }
        }];
    }
    
    
}


#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.userPhoneNumberTextField) {
        if (string.length == 0) return YES;
        
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 11) {
            return NO;
        }
    }
    if (textField == self.userPassWordTextField) {
        if (string.length == 0) return YES;
        
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 16) {
            return NO;
        }
    }
    
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.userPhoneNumberTextField resignFirstResponder];
    [self.userPassWordTextField resignFirstResponder];
}

@end
