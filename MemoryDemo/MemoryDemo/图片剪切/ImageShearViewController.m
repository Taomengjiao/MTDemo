
//
//  ImageShearViewController.m
//  MemoryDemo
//
//  Created by xyl on 2017/12/7.
//  Copyright © 2017年 xyl. All rights reserved.
//

#import "ImageShearViewController.h"
#import "ImageShearView.h"
@interface ImageShearViewController ()

@end

@implementation ImageShearViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(40, 120, 60, 60);
    imageView.image = [UIImage imageNamed:@"icon1.jpg"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    ImageShearView *shearView = [[ImageShearView alloc]init];
    shearView.frame = self.view.bounds;
    [self.view addSubview:shearView];
    [shearView updateDraw];
    

    [self.view addSubview:imageView];
    imageView.image = [self cricleImageWithName:imageView.image boardWidth:2 boardColor:[UIColor redColor]];
    
    
    
   
}




-(UIImage *)cricleImageWithName:(UIImage *)oldImage boardWidth:(CGFloat)boardWidth boardColor:(UIColor *)boardColor
{
    //    UIImage *oldImage = [[UIImage alloc]init];
    NSLog(@"image -- %@",oldImage);
    //开启上下文
    CGFloat imageW = 55  ;
    CGFloat imageH = 55 ;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    
    //获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [[UIColor greenColor] setFill];
    //画边框
    [[UIColor redColor] setStroke];
    CGFloat bigRadius = imageW / 2;//大圆半径
    //圆心所在的坐标
    CGFloat centerX = bigRadius;
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    //剪裁
//    CGContextClip(ctx);
    CGContextStrokePath(ctx);
    //小圆
    CGFloat smallRadius = bigRadius - boardWidth ;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    
    //剪裁
    CGContextClip(ctx);
    
    //画图
    [oldImage drawInRect:CGRectMake(boardWidth, boardWidth, oldImage.size.width, oldImage.size.height)];
    
    //取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束上下文
    UIGraphicsEndPDFContext();
    
    return newImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
