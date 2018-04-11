//
//  YROtherViewController.m
//  OCTestGPUImage
//
//  Created by yangrui on 2018/4/11.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "YROtherViewController.h"

#import "GPUImage.h"

 #import "GPUImageSepiaFilter.h" //褐色（怀旧）
#import "GPUImageToonFilter.h" //卡通效果（黑色粗线描边）
 #import "GPUImageSketchFilter.h" //素描
#import "GPUImageEmbossFilter.h" //浮雕效果，带有点3d的感觉
@interface YROtherViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation YROtherViewController

/** 褐色效果*/
- (IBAction)heSeBtnClick:(id)sender {
    GPUImageSepiaFilter *filter  = [GPUImageSepiaFilter new];
    
    [self handleImageWithFilter:filter];
}

/** 卡通效果*/
- (IBAction)toonBtnClick:(id)sender {
    
    GPUImageToonFilter *filter  = [GPUImageToonFilter new];
    
    [self handleImageWithFilter:filter];
}

/** 素描效果*/
- (IBAction)suMiaoBtnClick:(id)sender {
    GPUImageSketchFilter *filter  = [GPUImageSketchFilter new];
    
    [self handleImageWithFilter:filter];
}

/** 浮雕效果*/
- (IBAction)fuDiaoBtnClick:(id)sender {
    GPUImageEmbossFilter *filter  = [GPUImageEmbossFilter new];
    [self handleImageWithFilter:filter];
}



/** 根据滤镜来处理图片*/
-(void)handleImageWithFilter:(GPUImageFilter *)filter{
    
    //1、 获取源图片
    UIImage *sourceImage = [UIImage imageNamed:@"test.png"];
    
    //2、创建GPUImageOutPut
    GPUImagePicture *imagePic = [[GPUImagePicture alloc] initWithImage:sourceImage];
    
    //向 imagePic 中添加滤镜
    [imagePic addTarget:filter];
    
    //捕捉滤镜的下一帧
    [filter useNextFrameForImageCapture];
    
    // 执行相应的滤镜操作
    [imagePic processImage];
    
    //获取图片
    UIImage *newImage = [filter imageFromCurrentFramebuffer];
    self.imgView.image = newImage;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



@end
