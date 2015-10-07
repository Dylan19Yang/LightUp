//
//  SingleHomeDetailViewController.m
//  LightUp
//
//  Created by Forever.H on 15/10/7.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import "SingleHomeDetailViewController.h"

@interface SingleHomeDetailViewController ()

@end

@implementation SingleHomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.commentTableView.delegate = self;
    self.commentTableView.dataSource = self;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(375, 900);
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

#pragma mark - TableView

//Number of sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//Number of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //这里需要获取服务器上的总数
    
    return 3;
}


//Cell detail
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SingleHomeTableViewCell" forIndexPath:indexPath];
    cell.tag = indexPath.row;
    return cell;
}

@end
