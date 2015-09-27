//
//  RegisterViewController.m
//  LightUp
//
//  Created by Forever.H on 15/9/26.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isSelectGender = NO;
    self.registerNameTextField.delegate = self;
    self.registerPassWordTetxField.delegate = self;
    self.registerPhoneTextField.delegate = self;
    [self.maleBtn addTarget:self action:@selector(maleBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.femaleBtn addTarget:self action:@selector(femaleBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
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

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.registerNameTextField) {
        if (string.length == 0) return YES;
        
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 15) {
            return NO;
        }
    }
    if (textField == self.registerPhoneTextField) {
        if (string.length == 0) return YES;
        
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 11) {
            return NO;
        }
    }
    if (textField == self.registerPassWordTetxField) {
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
    [self.registerNameTextField resignFirstResponder];
    [self.registerPassWordTetxField resignFirstResponder];
    [self.registerPhoneTextField resignFirstResponder];
}

#pragma mark - ButtonEvent

- (void) maleBtnClickEvent
{
    self.isMale = YES;
    self.isSelectGender = YES;
    [self.maleBtn setBackgroundImage:[UIImage imageNamed:@"MaleOn"] forState:UIControlStateNormal];
    [self.femaleBtn setBackgroundImage:[UIImage imageNamed:@"Female"] forState:UIControlStateNormal];
}

- (void) femaleBtnClickEvent
{
    self.isMale = NO;
    self.isSelectGender = YES;
    [self.maleBtn setBackgroundImage:[UIImage imageNamed:@"Male"] forState:UIControlStateNormal];
    [self.femaleBtn setBackgroundImage:[UIImage imageNamed:@"FemaleOn"] forState:UIControlStateNormal];
}

- (IBAction)finshRegisterBtn:(id)sender {
    if(!self.isSelectGender)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"请选择性别" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if(self.registerNameTextField.text.length<=0)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"用户名不得为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if(self.registerPhoneTextField.text.length <= 0)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"手机号名不得为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if(self.registerPassWordTetxField.text.length < 6)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"密码长度必须大于6位" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        //注册接口
    }
    

}
@end
