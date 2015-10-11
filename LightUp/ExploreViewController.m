//
//  ExploreViewController.m
//  LightUp
//
//  Created by Forever.H on 15/9/26.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import "ExploreViewController.h"

@interface ExploreViewController ()

@end

@implementation ExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapScrollView.delegate = self;
    self.mapScrollView.contentSize = CGSizeMake(375, 900);
    [self.mapScrollView setScrollEnabled:YES];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:255/255.0 green:204/255.0 blue:0/255.0 alpha:1/255.0];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"LightupTitleWithoutBtn.png"] forBarMetrics:UIBarMetricsDefault];

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

@end
