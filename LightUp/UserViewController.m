//
//  UserViewController.m
//  LightUp
//
//  Created by Forever.H on 15/9/26.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import "UserViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "User.h"
#import "API.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isFollow = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:255/255.0 green:204/255.0 blue:0/255.0 alpha:1/255.0];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"LightupTitleWithoutBtn.png"] forBarMetrics:UIBarMetricsDefault];
    [self.followBtn addTarget:self action:@selector(followBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];

    if (self.isSelf) {
        self.followBtn.hidden=true;
        [self.userHeadImageView setImageWithURL:[NSURL URLWithString:[User sharedInstance].imageUrl]];
        self.persentNumberLabel.text=[NSString stringWithFormat:@"%.2f%%",[[User sharedInstance].percent floatValue]];
    }
    else{
        self.changeInfoButton.hidden=true;
        self.persentNumberLabel.text=self.percentage;
        [self.userHeadImageView  setImageWithURL:[NSURL URLWithString:self.imageUrl]];
        if ([self.state isEqualToString:@"1"]) {
            [self.followBtn setBackgroundImage:[UIImage imageNamed:@"Follow"] forState:UIControlStateNormal];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) followBtnClickEvent
{
    if(self.isFollow)
    {
        [self.followBtn setBackgroundImage:[UIImage imageNamed:@"Follow"] forState:UIControlStateNormal];
        self.isFollow = NO;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [[API sharedAPI] followWithUserId:[User sharedInstance].userId personId:self.userId andBLock:nil];
        });
    }
    else
    {
        [self.followBtn setBackgroundImage:[UIImage imageNamed:@"Unfollow"] forState:UIControlStateNormal];
        self.isFollow = YES;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [[API sharedAPI] followWithUserId:[User sharedInstance].userId personId:self.userId andBLock:nil];
        });
    }
    
}

- (IBAction)editBtn:(id)sender {
}
@end
