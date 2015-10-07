//
//  HomeDetailViewController.h
//  LightUp
//
//  Created by Forever.H on 15/9/26.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTableViewCell.h"
@interface HomeDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,CommentDelegate>
@property (weak, nonatomic) IBOutlet UITableView *HomeTableView;
@property (weak, nonatomic) IBOutlet UIView *CommentView;
@property (weak, nonatomic) IBOutlet UITextView *CommentTextView;


@property (nonatomic) NSInteger currentRow;

- (IBAction)SubmitCommentBtn:(id)sender;
- (IBAction)CancelCommentBtn:(id)sender;

- (IBAction)navigationItemBtn:(id)sender;

@end
