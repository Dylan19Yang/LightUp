//
//  User.m
//  LightUp
//
//  Created by YangYuxin on 15/9/27.
//  Copyright © 2015年 Atlas19. All rights reserved.
//

#import "User.h"
#import "API.h"
#import "Region.h"

@implementation User
+(User*)sharedInstance{
    static id _user=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _user=[[User alloc] init];
    });
    return _user;
}

-(void)loginWithAccount:(NSString*) account password:(NSString*)pwd andBLock:(ResponseBlock)block {
    [[API sharedAPI] loginWithAccount:account password:pwd andBLock:^(id responseObject, NSError *error) {
        if (!error) {
            NSDictionary *dic=(NSDictionary*)responseObject;
            if ([dic[@"state"] isEqualToString:@"11"]) {
                [self setInfoWithDic:(NSDictionary*)responseObject];
            }
        }
        if (block) {
            block(responseObject,error);
        }
    }];
}

-(void)registerWithName:(NSString*)name mobile:(NSString*)mobile password:(NSString*)pwd gender:(NSString*)gender andBLock:(ResponseBlock)block {
    [[API sharedAPI] registerWithName:name mobile:mobile password:pwd gender:gender andBLock:^(id responseObject, NSError *error) {
        if (!error) {
            NSDictionary *dic=(NSDictionary*)responseObject;
            if ([dic[@"state"] isEqualToString:@"11"]) {
                [self setInfoWithDic:(NSDictionary*)responseObject];
            }
        }
        if (block) {
            block(responseObject,error);
        }

    }];
}

-(void)setInfoWithDic:(NSDictionary*)dic {
    if ([dic objectForKey:@"User_id"]) {
        self.userId=dic[@"User_id"];
    }
    else if ([dic objectForKey:@"User_name"]) {
        self.userName=dic[@"User_name"];
    }
    else if ([dic objectForKey:@"User_mobile"]) {
        self.userPhone=dic[@"User_mobile"];
    }

    else if ([dic objectForKey:@"User_birthday"]) {
        self.birthday=dic[@"User_birthday"];
    }
    else if ([dic objectForKey:@"User_achievement"]) {
        self.percent=[NSNumber numberWithDouble:[dic[@"User_achievement"] doubleValue]*100];
    }
    else if ([dic objectForKey:@"User_headshot"]) {
        self.imageUrl=dic[@"User_headshot"];
    }
    else if ([dic objectForKey:@"Region_id_set"]) {
        NSMutableArray *array=[[NSMutableArray alloc] init];
        for (NSDictionary* regionDic in [dic objectForKey:@"Region_id_set"]) {
            Region *region=[[Region alloc] initWithDic:regionDic];
            [array addObject:region];
        }
        self.location=array;
    }

}

-(void)setIsMale:(BOOL)isMale {
    if (isMale) {
        self.gender=@"男";
    }
    else {
        self.gender=@"女";
    }
    _isMale=isMale;
}
@end
