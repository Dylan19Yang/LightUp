//
//  ExploreDetailViewController.m
//  LightUp
//
//  Created by Forever.H on 15/9/27.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import "ExploreDetailViewController.h"
#import "ExploreDetailTableViewCell.h"
@interface ExploreDetailViewController ()

@end

@implementation ExploreDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.exploreDetailTableView.delegate = self;
    self.exploreDetailTableView.dataSource = self;
    self.automaticallyAdjustsScrollViewInsets = NO; //必须要加上这句话，不然上面会有留白
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    
    ExploreDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExploreDetailViewCell" forIndexPath:indexPath];
    
    //    if(cell == nil)
    //    {
    //        NSLog(@"cell = nil");
    //        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdetify];
    //    }
    
    return cell;
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
