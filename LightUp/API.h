//
//  API.h
//  LightUp
//
//  Created by YangYuxin on 15/9/24.
//  Copyright © 2015年 Atlas19. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface API : NSObject
+ (API *)sharedAPI;

-(void)loginWithAccount:(NSString*) account password:(NSString*)pwd andBLock:(ResponseBlock)block;
@end
