//
//  AppDelegate.h
//  LightUp
//
//  Created by YangYuxin on 15/9/22.
//  Copyright © 2015年 Atlas19. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    BMKMapManager* _mapManager;
}

@property (strong, nonatomic) UIWindow *window;


@end

