//
//  PhotoViewController.h
//  LightUp
//
//  Created by Forever.H on 15/9/26.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <QuartzCore/QuartzCore.h>
#import <BaiduMapAPI/BMKLocationService.h>
#import <BaiduMapAPI/BMKGeocodeSearch.h>

@interface PhotoViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>


@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property(nonatomic, strong) NSData *fileData;
@property(nonatomic,strong) BMKLocationService *locService;
@property(nonatomic,strong) BMKUserLocation* userLocation;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIView *pushView;

- (IBAction)lightupBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *sharetoWeiboBtn;
@property (nonatomic) BOOL isShare;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelBtn;
- (IBAction)cancelBtnClickEvent:(id)sender;

- (IBAction)camera:(id)sender;
- (IBAction)album:(id)sender;

@end
