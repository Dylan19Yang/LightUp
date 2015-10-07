//
//  SingleHomeDetailViewController.h
//  LightUp
//
//  Created by Forever.H on 15/10/7.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleHomeDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *commentTableView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
