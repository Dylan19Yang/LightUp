//
//  ExploreDetailViewController.h
//  LightUp
//
//  Created by Forever.H on 15/9/27.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExploreDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *exploreDetailTableView;

@end
