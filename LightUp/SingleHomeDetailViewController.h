//
//  SingleHomeDetailViewController.h
//  LightUp
//
//  Created by Forever.H on 15/10/7.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"

@interface SingleHomeDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *commentTableView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *messageImageButton;
@property (weak, nonatomic) IBOutlet UILabel *locationDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *remarkButton;
@property (weak, nonatomic) IBOutlet UILabel *percentLabel;
@property (weak, nonatomic) IBOutlet UIButton *headButton;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *locationDescription;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *percent;
@property (nonatomic, strong) UIImage *user;
@property (nonatomic, strong) UIImage *content;
@property (nonatomic, strong) Message *message;


@end
