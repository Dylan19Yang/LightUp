//
//  API.m
//  LightUp
//
//  Created by YangYuxin on 15/9/24.
//  Copyright © 2015年 Atlas19. All rights reserved.
//

#import "API.h"
#import "HttpClient.h"

@implementation API
#pragma mark - Singleton
+ (instancetype)sharedAPI{
    static API *_sharedAPI = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _sharedAPI = [[API alloc]init];
    });
    return _sharedAPI;
}

#pragma mark - Get methods
-(void)loginWithAccount:(NSString*)mobile
               password:(NSString*)pwd
               andBLock:(ResponseBlock)block{
    
    [[HttpClient sharedClient] getAPI:API_Login
                               params:@{@"User_mobile":mobile,
                                        @"User_pwd":pwd}
                                block:block];
}

-(void)registerWithName:(NSString*)name
                 mobile:(NSString*)mobile
               password:(NSString*)pwd
                 gender:(NSString*)gender
               andBLock:(ResponseBlock)block{
    [[HttpClient sharedClient] getAPI:API_Register
                               params:@{@"User_name":name,
                                        @"User_mobile":mobile,
                                        @"User_pwd":pwd,
                                        @"User_gender":gender}
                                block:block];
}

-(void)allMessagesWithUserId:(NSString*)identify
               andBLock:(ResponseBlock)block{
    [[HttpClient sharedClient] getAPI:API_User_Follow_All_Message
                               params:@{@"User_id":identify}
                                block:block];
}

-(void)messageRemarkWithMessageId:(NSString*)messageId
               andBLock:(ResponseBlock)block{
    [[HttpClient sharedClient] getAPI:API_Message_Remark
                               params:@{@"Message_id":messageId}
                                block:block];
}

-(void)addRemarkWithUserId:(NSString*)identify
                 messageId:(NSString*)messageId
                   content:(NSString*)content
            andBLock:(ResponseBlock)block{
    [[HttpClient sharedClient] getAPI:API_Add_Remark
                               params:@{@"User_id":identify,
                                        @"Message_id":messageId,
                                        @"Remark_content":content}
                                block:block];
}

-(void)currentLocationWithLongitude:(NSString*)longitude
                           latitude:(NSString*)latitude
                         andBLock:(ResponseBlock)block{
    [[HttpClient sharedClient] getAPI:API_Current_Location_Message
                               params:@{@"Region_center_x":longitude,
                                        @"Region_center_y":latitude}
                                block:block];
}

-(void)messageDetailWithMessageId:(NSString*)messageId
                           userId:(NSString*)identify
                         andBLock:(ResponseBlock)block{
    [[HttpClient sharedClient] getAPI:API_Message_Detail
                               params:@{@"Message_id":messageId,
                                        @"User_id":identify}
                                block:block];
}

-(void)districtMessageWithDistrictId:(NSString*)districtId
                         andBLock:(ResponseBlock)block{
    [[HttpClient sharedClient] getAPI:API_District_Message
                               params:@{@"District_id":districtId}
                                block:block];
}

-(void)showPersonHomePageWithUserId:(NSString*)identify
                           personId:(NSString*)personId
                         andBLock:(ResponseBlock)block{
    [[HttpClient sharedClient] getAPI:API_Other_Home_Page
                               params:@{@"User_id":identify,
                                        @"Person_id":personId}
                                block:block];
}

-(void)followWithUserId:(NSString*)identify
                           personId:(NSString*)personId
                           andBLock:(ResponseBlock)block{
    [[HttpClient sharedClient] getAPI:API_Follow
                               params:@{@"User_id":identify,
                                        @"Person_id":personId}
                                block:block];
}

-(void)searchUserWIthUserId:(NSString*)identify
               personName:(NSString*)personName
               andBLock:(ResponseBlock)block{
    [[HttpClient sharedClient] getAPI:API_Search_User
                               params:@{@"User_id":identify,
                                        @"Person_name":personName}
                                block:block];
}

-(void)editUserInfoWithUserId:(NSString*)identify
                       gender:(NSString*)gender
                     birthday:(NSString*)birthday
                     andBLock:(ResponseBlock)block{
    [[HttpClient sharedClient] getAPI:API_Edit_User_Info
                               params:@{@"User_id":identify,
                                        @"User_gender":gender,
                                        @"User_birthday":birthday}
                                block:block];

}
#pragma mark - Post Methods
-(void)sendMessageWithContent:(NSString*)content
                     identify:(NSString*)identify
                    longitude:(NSString*)longitude
                     latitude:(NSString*)latitude
                        image:(UIImage*)image
                     fileName:(NSString*)fileName
                     andBlock:(ResponseBlock)block {
    [[HttpClient sharedClient] uploadPictureAPI:API_Send_Message
                                         params:@{@"Message_content":content,
                                                  @"User_id":identify,
                                                  @"Region_center_x":longitude,
                                                  @"Region_center_y":latitude}
                                          image:image
                                      imageName:@"pic_file"
                                       fileName:fileName
                                       andBlock:block];
}

-(void)sendMessageUserId:(NSString*)identify
                   image:(UIImage*)image
                fileName:(NSString*)fileName
                andBlock:(ResponseBlock)block {
    [[HttpClient sharedClient] uploadPictureAPI:API_UploadHeadShot
                                         params:@{@"User_id":identify}
                                          image:image
                                      imageName:@"pic_file"
                                       fileName:fileName
                                       andBlock:block];
}

@end
