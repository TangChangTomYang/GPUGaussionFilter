//
//  ViewController.m
//  OCTestGPUImage
//
//  Created by yangrui on 2018/4/11.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "ViewController.h"
#import "GPUImage.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/** GPUImage 高斯模糊
 */
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //1、获取需要高斯模糊处理的图片
    UIImage *sourceImage = [UIImage imageNamed:@"test.png"];
    
    //2、 根据源图片创建 GPUImageOutput
    GPUImagePicture *imagePic = [[GPUImagePicture alloc]initWithImage:sourceImage];
    
    //3、创建高斯模糊滤镜
    GPUImageGaussianBlurFilter *gaussionFilter = [[GPUImageGaussianBlurFilter alloc]init];
    //4、设置纹理参数  一般设置5
    gaussionFilter.texelSpacingMultiplier = 3;
    //5、 设置像素圆角 这个参数让图片 看起更圆润
    gaussionFilter.blurRadiusInPixels = 8;
    
    //6、添加高斯滤镜
    [imagePic addTarget:gaussionFilter];
    
    //7、 执行滤镜处理
    [gaussionFilter useNextFrameForImageCapture];
    [imagePic processImage];
    
    
    // 8、获取处理后的图片
   UIImage *nImage =  [gaussionFilter imageFromCurrentFramebuffer];
   self.imageView.image = nImage;
    
    
    
}

@end
