//
//  Region.m
//  LightUp
//
//  Created by YangYuxin on 15/9/27.
//  Copyright © 2015年 Atlas19. All rights reserved.
//

#import "Region.h"

@implementation Region
-(instancetype)initWithDic:(NSDictionary*)dic{
    Region *_region=[self init];
    [_region setInfoWithDic:dic];
    return _region;
}

-(void)setInfoWithDic:(NSDictionary*)dic {
    self.regionId=dic[@"Region_id"];
    self.districtId=dic[@"Region_id"];
    self.point=CGPointMake([dic[@"Region_center_x"] floatValue], [dic[@"Region_center_y"] floatValue]);
    self.radius=[NSNumber numberWithFloat:[dic[@"Region_id"] floatValue]];
}
@end
