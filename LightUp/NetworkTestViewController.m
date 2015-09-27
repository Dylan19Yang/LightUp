//
//  NetworkTestViewController.m
//  LightUp
//
//  Created by YangYuxin on 15/9/27.
//  Copyright © 2015年 Atlas19. All rights reserved.
//

#import "NetworkTestViewController.h"
#import "API.h"

@interface NetworkTestViewController ()

@end

@implementation NetworkTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)login:(id)sender {
    [[API sharedAPI] loginWithAccount:@"18605759818" password:@"123" andBLock:^(id responseObject, NSError *error) {
        ;
    }];
}

- (IBAction)reg:(id)sender {
}

- (IBAction)send:(id)sender {
    [[API sharedAPI] sendMessageWithContent:@"321" identify:@"3" longitude:@"121.528296" latitude:@"31.274877" image:[UIImage imageNamed:@"apple"] fileName:@"123.jpg" andBlock:^(id responseObject, NSError *error) {
        ;
    }];
}

- (IBAction)info:(id)sender {
}

- (IBAction)remark:(id)sender {
}

- (IBAction)addremark:(id)sender {
}

- (IBAction)location:(id)sender {
}

- (IBAction)detailMessage:(id)sender {
}

- (IBAction)districk:(id)sender {
}

- (IBAction)page:(id)sender {
}

- (IBAction)follow:(id)sender {
}

- (IBAction)search:(id)sender {
}

- (IBAction)edit:(id)sender {
}

- (IBAction)headshot:(id)sender {
}
@end
