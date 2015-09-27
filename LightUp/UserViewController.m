//
//  UserViewController.m
//  LightUp
//
//  Created by Forever.H on 15/9/26.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isFollow = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:255/255.0 green:204/255.0 blue:0/255.0 alpha:1/255.0];
    [self.followBtn addTarget:self action:@selector(followBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
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

- (void) followBtnClickEvent
{
    if(self.isFollow)
    {
        [self.followBtn setBackgroundImage:[UIImage imageNamed:@"Follow"] forState:UIControlStateNormal];
        self.isFollow = NO;
        //取消关注
    }
    else
    {
        [self.followBtn setBackgroundImage:[UIImage imageNamed:@"Unfollow"] forState:UIControlStateNormal];
        self.isFollow = YES;
        //关注
    }
    
}

- (IBAction)editBtn:(id)sender {
}
@end
