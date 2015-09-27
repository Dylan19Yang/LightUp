//
//  RegisterViewController.h
//  LightUp
//
//  Created by Forever.H on 15/9/26.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *registerNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *registerPhoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *registerPassWordTetxField;

@property (nonatomic) BOOL isMale;
@property (nonatomic) BOOL isSelectGender;

@property (weak, nonatomic) IBOutlet UIButton *maleBtn;
@property (weak, nonatomic) IBOutlet UIButton *femaleBtn;

- (IBAction)finshRegisterBtn:(id)sender;

@end
