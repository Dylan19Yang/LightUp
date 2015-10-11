//
//  PhotoViewController.m
//  LightUp
//
//  Created by Forever.H on 15/9/26.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import "PhotoViewController.h"
#import "API.h"
#import "User.h"

@interface PhotoViewController ()


@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置定位精确度，默认：kCLLocationAccuracyBest
    [BMKLocationService setLocationDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    //指定最小距离更新(米)，默认：kCLDistanceFilterNone
    [BMKLocationService setLocationDistanceFilter:100.f];
    
    //初始化BMKLocationService
    self.locService = [[BMKLocationService alloc]init];
    self.locService.delegate = self;
    //启动LocationService
    [self.locService startUserLocationService];
}

- (IBAction)send:(id)sender {
    NSString *userId=[User sharedInstance].userId;
    NSDate *now=[NSDate date];
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-DD-HH-mm-ss"];
    NSString *time=[formatter stringFromDate:now];
    NSString *fileName=[[userId stringByAppendingString:time] stringByAppendingString:@".png"];
    UIAlertView *waitView=[[UIAlertView alloc] initWithTitle:@"请稍候" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [waitView show];
    [[API sharedAPI] sendMessageWithContent:self.textView.text identify:userId longitude:[NSString stringWithFormat:@"%f",self.userLocation.location.coordinate.longitude] latitude:[NSString stringWithFormat:@"%f",self.userLocation.location.coordinate.latitude] image:self.img.image fileName:fileName andBlock:^(id responseObject, NSError *error) {
        [waitView dismissWithClickedButtonIndex:0 animated:YES];
        if (error) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"网络异常" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
}

- (IBAction)camera:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    //            [self presentModalViewController:imagePicker animated:YES];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)album:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //            [self presentModalViewController:imagePicker animated:YES];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark -
#pragma UIImagePickerController Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:(__bridge NSString *)kUTTypeImage]) {
        UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
        [self performSelector:@selector(saveImage:)  withObject:img afterDelay:0.5];
    }
    //    [picker dismissModalViewControllerAnimated:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //    [picker dismissModalViewControllerAnimated:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveImage:(UIImage *)image {
    //    NSLog(@"保存头像！");
    //    [userPhotoButton setImage:image forState:UIControlStateNormal];
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *imageFilePath = [documentsDirectory stringByAppendingPathComponent:@"selfPhoto.jpg"];
    NSLog(@"imageFile->>%@",imageFilePath);
    success = [fileManager fileExistsAtPath:imageFilePath];
    if(success) {
        success = [fileManager removeItemAtPath:imageFilePath error:&error];
    }
    //    UIImage *smallImage=[self scaleFromImage:image toSize:CGSizeMake(80.0f, 80.0f)];//将图片尺寸改为80*80
    UIImage *smallImage = [self thumbnailWithImageWithoutScale:image size:CGSizeMake(93, 93)];
    [UIImageJPEGRepresentation(smallImage, 1.0f) writeToFile:imageFilePath atomically:YES];//写入文件
    UIImage *selfPhoto = [UIImage imageWithContentsOfFile:imageFilePath];//读取图片文件
    //    [userPhotoButton setImage:selfPhoto forState:UIControlStateNormal];
    self.img.image = selfPhoto;
}

// 改变图像的尺寸，方便上传服务器
- (UIImage *) scaleFromImage: (UIImage *) image toSize: (CGSize) size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


//#pragma mark -
//#pragma mark UIImagePickerControllerDelegate methods
////完成选择图片
//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
//{
//    //加载图片
//    self.img.image = image;
//    //选择框消失
//    [picker dismissViewControllerAnimated:YES completion:nil];
//}
////取消选择图片
//-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//    [picker dismissViewControllerAnimated:YES completion:nil];
//}
//
//- (IBAction)cameraBtn:(id)sender
//
//{
//
//    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
//
//    imagePicker.delegate = self;
//
//    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;//获取类型是摄像头，还可以是相册
//
//    imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//
//    imagePicker.allowsEditing = NO;//如果为NO照出来的照片是原图，比如4s和5的iPhone出来的尺寸应该是（2000+）*（3000+），差不多800W像素，如果是YES会有个选择区域的方形方框
//
//    //    imagePicker.showsCameraControls = NO;//默认是打开的这样才有拍照键，前后摄像头切换的控制，一半设置为NO的时候用于自定义ovelay
//
////    UIImageView *overLayImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 640)];
////    overLayImg.image = [UIImage imageNamed:@"overlay.png"];
//
////    imagePicker.cameraOverlayView = overLayImg;//3.0以后可以直接设置cameraOverlayView为overlay
////    imagePicker.wantsFullScreenLayout = YES;
//
//    [self presentModalViewController:imagePicker animated:YES];
//
//}


//2.保持原来的长宽比，生成一个缩略图
- (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize
{
    UIImage *newimage;
    if (nil == image) {
        newimage = nil;
    }
    else{
        CGSize oldsize = image.size;
        CGRect rect;
        if (asize.width/asize.height > oldsize.width/oldsize.height) {
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            rect.size.height = asize.height;
            rect.origin.x = (asize.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        else{
            rect.size.width = asize.width;
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (asize.height - rect.size.height)/2;
        }
        UIGraphicsBeginImageContext(asize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        [image drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}

#pragma mark - BDMap Delegate
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    //NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    self.userLocation=userLocation;
    
    BMKGeoCodeSearch* searcher =[[BMKGeoCodeSearch alloc]init];
    searcher.delegate = self;
    CLLocationCoordinate2D pt = userLocation.location.coordinate;
    BMKReverseGeoCodeOption *reverseGeoCodeSearchOption = [[
                                                            BMKReverseGeoCodeOption alloc]init];
    reverseGeoCodeSearchOption.reverseGeoPoint = pt;
    BOOL flag = [searcher reverseGeoCode:reverseGeoCodeSearchOption];
    if(flag)
    {
        NSLog(@"反geo检索发送成功");
    }
    else
    {
        NSLog(@"反geo检索发送失败");
    }
}

//接收反向地理编码结果
-(void) onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:
(BMKReverseGeoCodeResult *)result
                        errorCode:(BMKSearchErrorCode)error{
    if (error == BMK_SEARCH_NO_ERROR) {
        self.locationLabel.text=result.address;
    }
    else {
        NSLog(@"抱歉，未找到结果");
    }
}
@end
