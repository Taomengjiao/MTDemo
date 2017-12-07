//
//  ImageShearView.m
//  MemoryDemo
//
//  Created by xyl on 2017/12/7.
//  Copyright © 2017年 xyl. All rights reserved.
//

#import "ImageShearView.h"

@implementation ImageShearView

-(instancetype)init
{
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor whiteColor];
//        [self layoutIfNeeded];
        NSLog(@"init");
        
        
    }
    return self;
}

-(void)updateDraw
{
    NSLog(@"updateDraw");

    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
    NSLog(@"drawRect");
    [self drawCricle];
    
}

-(void)drawCricle
{
#if 1
    CGFloat circleWH = 200;
    CGFloat boardWidth = 5;
    CGSize circleSize = CGSizeMake(circleWH, circleWH);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat bigRadius = circleWH / 2;
//    CGFloat centerXY = bigRadius;
    CGFloat centerX = 250;
    CGFloat centerY = 350;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI *2, 0);
    
    [[UIColor redColor] setStroke];
//    CGContextFillPath(ctx);
    CGContextStrokePath(ctx);
    
    CGFloat smallRadius = bigRadius - boardWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI *2, 0);
    
    [[UIColor greenColor]set];
    CGContextFillPath(ctx);
    UIGraphicsEndImageContext();
#endif
#if 0
    CGContextRef arcContext = UIGraphicsGetCurrentContext();
    
    CGFloat radius = 50.0f;
    CGFloat startAngle = 0;
    CGFloat endAngle = M_PI;
    int clockwise = 1;
    /**
     圆弧
     
     x,y 表示圆心坐标
     @param radius#> 半径 description#>
     @param startAngle#> 开始角度 description#>
     @param endAngle#> 结束角度 description#>
     @param clockwise#> 圆弧的伸展方向（0：顺时针，1：逆时针） description#>
     @return
     */
    CGContextAddArc(arcContext, 200, 200, radius, startAngle, endAngle, clockwise);
    
    [[UIColor redColor]setStroke];
    
    [[UIColor greenColor]setFill];
    
    //绘制空心路径
    CGContextStrokePath(arcContext);
#endif
}



@end
