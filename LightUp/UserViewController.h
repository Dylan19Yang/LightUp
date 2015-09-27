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
@property (nonatomic) BOOL isFollow;
@end
