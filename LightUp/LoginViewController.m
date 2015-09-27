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
        //登陆接口
        //[[HttpClient sharedClient] uploadPictureAPI:@"http://192.168.1.109:9993/test.php" params:nil image:[UIImage imageNamed:@"apple"] imageName:@"food_pic_file" fileName:@"1.png" andBlock:nil];
        DetailTabBarViewController *tabBarViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailTabBarController"];
        [self presentViewController:tabBarViewController animated:YES completion:nil];
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
