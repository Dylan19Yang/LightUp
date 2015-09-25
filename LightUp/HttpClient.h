//
//  HttpClient.h
//  LightUp
//
//  Created by YangYuxin on 15/9/24.
//  Copyright © 2015年 Atlas19. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface HttpClient : AFHTTPSessionManager
+ (HttpClient *)sharedClient;
- (void)getAPI:(NSString *)api params:(NSDictionary *)par block:(ResponseBlock)block;
- (void)postAPI:(NSString *)api params:(NSDictionary *)par block:(ResponseBlock)block;
-(void)uploadPictureAPI:(NSString *)api params:(NSDictionary *)par image:(UIImage *)image imageName:(NSString *)name fileName:(NSString *)fileName andBlock:(ResponseBlock)block;
@end
