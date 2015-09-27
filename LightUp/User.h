//
//  User.h
//  LightUp
//
//  Created by YangYuxin on 15/9/27.
//  Copyright © 2015年 Atlas19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface User : NSObject
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *userPhone;
@property (nonatomic, strong) NSString *birthday;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic) BOOL isMale;
@property (nonatomic) NSNumber *percent;
@property (nonatomic, strong) NSArray *location;
//@property (nonatomic, strong) UIImage *headShot;
@property (nonatomic, strong) NSString *imageUrl;
+(User*)sharedInstance;
-(void)loginWithAccount:(NSString*) account password:(NSString*)pwd andBLock:(ResponseBlock)block;
-(void)registerWithName:(NSString*)name mobile:(NSString*)mobile password:(NSString*)pwd gender:(NSString*)gender andBLock:(ResponseBlock)block;
@end
