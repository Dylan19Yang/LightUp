//
//  CommentTableViewCell.h
//  LightUp
//
//  Created by Forever.H on 15/10/7.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userSchool;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *commetDate;
@property (weak, nonatomic) IBOutlet UIButton *userHead;
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;

@end
