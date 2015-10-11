//
//  UserViewController.h
//  LightUp
//
//  Created by Forever.H on 15/9/26.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController
- (IBAction)editBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *followBtn;
@property (weak, nonatomic) IBOutlet UIImageView *userHeadImageView;
@property (weak, nonatomic) IBOutlet UILabel *persentNumberLabel;
@property (weak, nonatomic) IBOutlet UITableView *userInfoTableView;
@property (weak, nonatomic) IBOutlet UIButton *changeInfoButton;
@property (nonatomic) BOOL isFollow;
@property (nonatomic, strong) NSString* userId;
@property (nonatomic) BOOL isSelf;
@property (nonatomic,strong) NSString *imageUrl;
@property (nonatomic,strong) NSString *percentage;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *state;
@end
