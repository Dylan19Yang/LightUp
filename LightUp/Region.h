//
//  Region.h
//  LightUp
//
//  Created by YangYuxin on 15/9/27.
//  Copyright © 2015年 Atlas19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Region : NSObject
@property (nonatomic,strong) NSString* regionId;
@property (nonatomic,strong) NSString* districtId;
@property (nonatomic) CGPoint point;
@property (nonatomic,strong) NSNumber* radius;
-(instancetype)initWithDic:(NSDictionary*)dic;
@end
