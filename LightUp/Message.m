//
//  Message.m
//  LightUp
//
//  Created by YangYuxin on 15/10/7.
//  Copyright © 2015年 Atlas19. All rights reserved.
//

#import "Message.h"

@implementation Message
+(Message*)currentMessage{
    static Message *_message=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _message=[[Message alloc] init];
    });
    return _message;
}
@end
