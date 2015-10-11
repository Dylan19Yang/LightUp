//
//  DetailTabBarViewController.m
//  LightUp
//
//  Created by Forever.H on 15/9/26.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import "DetailTabBarViewController.h"
#import "HomeNavgationViewController.h"
#import "HomeDetailViewController.h"

@interface DetailTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation DetailTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSUInteger index = self.selectedIndex;
    HomeNavgationViewController* vc=self.viewControllers[0];
    HomeDetailViewController* des=vc.viewControllers[0];
    des.district=@"-1";
}
@end
