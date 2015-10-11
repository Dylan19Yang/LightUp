//
//  SingleHomeDetailViewController.m
//  LightUp
//
//  Created by Forever.H on 15/10/7.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import "SingleHomeDetailViewController.h"
#import "API.h"
#import "CommentTableViewCell.h"
#import "Comment.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface SingleHomeDetailViewController ()
@property (nonatomic, strong) NSMutableArray *source;
@end

@implementation SingleHomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.commentTableView.delegate = self;
    self.commentTableView.dataSource = self;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(375, 900);
    // Do any additional setup after loading the view.
    
    self.percentLabel.text=self.percent;
    [self.headButton setBackgroundImage:self.user forState:UIControlStateNormal];
    [self.messageImageButton setBackgroundImage:self.content forState:UIControlStateNormal];
    self.nameLabel.text=self.name;
    self.locationDescriptionLabel.text=self.locationDescription;
    self.timeLabel.text=self.time;
}

-(void)viewWillAppear:(BOOL)animated {
    self.source=[NSMutableArray array];
    UIAlertView *waitView=[[UIAlertView alloc] initWithTitle:@"请稍候" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [waitView show];
    [[API sharedAPI] messageRemarkWithMessageId:self.message.messageId andBLock:^(id responseObject, NSError *error) {
        [waitView dismissWithClickedButtonIndex:0 animated:YES];
        NSArray *array=(NSArray*)responseObject;
        if (error) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"网络异常" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
        else {
            for (NSDictionary *dic in array) {
                Comment *comment=[[Comment alloc] init];
                comment.userId=dic[@"User_id"];
                comment.time=dic[@"Remark_time"];
                comment.userName=dic[@"User_name"];
                comment.content=dic[@"Remark_content"];
                comment.headshot=dic[@"User_headshot"];
                [self.source addObject:comment];
            }
            [self.commentTableView reloadData];
        }

    }];
}

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.source count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SingleHomeTableViewCell" forIndexPath:indexPath];
    Comment *comment=self.source[indexPath.row];
    cell.userName.text=comment.userName;
    cell.commetDate.text=comment.time;
    cell.commentTextView.text=comment.content;
    [cell.headShotImage setImageWithURL:[NSURL URLWithString:[ApiBaseUrl stringByAppendingString:comment.headshot]]];
    return cell;
}

@end
