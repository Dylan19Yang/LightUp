//
//  NetworkConstants.h
//  LightUp
//
//  Created by YangYuxin on 15/9/24.
//  Copyright © 2015年 Atlas19. All rights reserved.
//
#import <Foundation/Foundation.h>

#ifndef NetworkConstants_h
#define NetworkConstants_h

#define ApiBaseUrl                              @"http://192.168.1.107:9993/"

#define API_Login                               @"Login.php"
#define API_Register                            @"Register.php"
#define API_Send_Message                        @"Send_message.php"
#define API_User_Follow_All_Message             @"Info_stream.php"
#define API_Message_Remark                      @"Show_remark.php"
#define API_Add_Remark                          @"Add_remark.php"
#define API_Current_Location_Message            @"Recent_location.php"
#define API_Message_Detail                      @"Show_single_message.php"
#define API_District_Message                    @"Show_district_messages.php"
#define API_Other_Home_Page                     @"Show_person_homepage.php"
#define API_Follow                              @"Follow.php"
#define API_Search_User                         @"Search_user.php"
#define API_Edit_User_Info                      @"Edit_userinfo.php"
#define API_UploadHeadShot                      @"Edit_headshot.php"

//typedef block
typedef void (^ResponseBlock)(id responseObject, NSError *error);
typedef void (^ResponseError)(NSError *err);
typedef void (^ResponseArray)(NSArray *responseArray, NSError *error);
typedef void (^ResponseString)(NSString *responseString);
#endif /* NetworkConstants_h */
