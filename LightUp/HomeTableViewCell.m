//
//  HomeTableViewCell.m
//  LightUp
//
//  Created by Forever.H on 15/9/26.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [self.CommentBtn addTarget:self action:@selector(showComment:) forControlEvents:UIControlEventTouchUpInside];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)showComment:(id)sender
{
    NSLog(@"Click Btn");
    //HomeTableViewCell *cell = (HomeTableViewCell *)[[sender superview] superview];
    [self.myDelegate showCommentView:self.tag];
}

-(void)like{
    [self.myDelegate like:self];
}
@end
