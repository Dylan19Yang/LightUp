//
//  API.h
//  LightUp
//
//  Created by YangYuxin on 15/9/24.
//  Copyright © 2015年 Atlas19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface API : NSObject
+ (API *)sharedAPI;

-(void)loginWithAccount:(NSString*) account password:(NSString*)pwd andBLock:(ResponseBlock)block;
-(void)registerWithName:(NSString*)name mobile:(NSString*)mobile password:(NSString*)pwd gender:(NSString*)gender andBLock:(ResponseBlock)block;
-(void)allMessagesWithUserId:(NSString*)identify andBLock:(ResponseBlock)block;
-(void)messageRemarkWithMessageId:(NSString*)messageId andBLock:(ResponseBlock)block;
-(void)addRemarkWithUserId:(NSString*)identify messageId:(NSString*)messageId content:(NSString*)content andBLock:(ResponseBlock)block;
-(void)currentLocationWithLongitude:(NSString*)longitude latitude:(NSString*)latitude andBLock:(ResponseBlock)block;
-(void)messageDetailWithMessageId:(NSString*)messageId userId:(NSString*)identify andBLock:(ResponseBlock)block;
-(void)districtMessageWithDistrictId:(NSString*)districtId andBLock:(ResponseBlock)block;
-(void)showPersonHomePageWithUserId:(NSString*)identify personId:(NSString*)personId andBLock:(ResponseBlock)block;
-(void)followWithUserId:(NSString*)identify personId:(NSString*)personId andBLock:(ResponseBlock)block;
-(void)searchUserWIthUserId:(NSString*)identify personName:(NSString*)personName andBLock:(ResponseBlock)block;
-(void)editUserInfoWithUserId:(NSString*)identify gender:(NSString*)gender birthday:(NSString*)birthday andBLock:(ResponseBlock)block;
-(void)sendMessageWithContent:(NSString*)content identify:(NSString*)identify longitude:(NSString*)longitude latitude:(NSString*)latitude image:(UIImage*)image fileName:(NSString*)fileName andBlock:(ResponseBlock)block;
-(void)sendMessageUserId:(NSString*)identify image:(UIImage*)image fileName:(NSString*)fileName andBlock:(ResponseBlock)block;
@end
