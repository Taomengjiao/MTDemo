//
//  MTDrawForColorView.m
//  MTDraw
//
//  Created by xyl on 17/3/30.
//  Copyright © 2017年 memoryDemo. All rights reserved.
//

#import "MTDrawForColorView.h"

@implementation MTDrawForColorView


-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawForLinearDradientWithContext:context];
    
    [self drawForRadialGradient:context];
}

-(void)drawForLinearDradientWithContext:(CGContextRef )context
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    /**
     指定了RGB的颜色空间，四个元素代表一个颜色（r,g,b,alpha）
     这里三个颜色，所以有12个元素
     */
    CGFloat compoents[12]={
        248.0/255.0,86.0/255.0,86.0/255.0,1,
        249.0/255.0,127.0/255.0,127.0/255.0,1,
        1.0,1.0,1.0,1.0
    };
    
    /**
     颜色所在位置，范围（0~1）,元素个数不能少于components中的颜色个数
     */
    CGFloat locations[3]={0,0.3,1.0};
    
    
    /**
     指定渐变色

     @param space#> 颜色空间 description#>
     @param components#> 颜色数组 description#>
     @param locations#> 颜色所在位置范围 description#>
     @param count#> 渐变个数，等于locations的个数 description#>
     @return
     */
    CGGradientCreateWithColorComponents(colorSpace, compoents, locations, 3);
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, compoents, locations, 3);
    
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(self.bounds.size.width, self.bounds.size.height);
    
    /**
     绘制线性渐变

     @param c#> context description#>
     @param gradient#> 指定的渐变色 description#>
     @param startPoint#> 起始位置 description#>
     @param endPoint#> 结束位置 description#>
     @param options#> 绘制方式 description#>
     kCGGradientDrawsBeforeStartLocation 开始位置之前就进行绘制，到结束位置之后不再绘制，
     kCGGradientDrawsAfterEndLocation开始位置之前不进行绘制，到结束点之后继续填充
     @return
     */
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, kCGGradientDrawsAfterEndLocation);
    
    //释放颜色空间
    CGColorSpaceRelease(colorSpace);
}

-(void)drawForRadialGradient:(CGContextRef)context
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
   
    CGFloat compoents[12]={
        86.0/255.0,86.0/255.0,248.0/255.0,1,
        127.0/255.0,127.0/255.0,249.0/255.0,1,
        1.0,1.0,1.0,1.0
    };
    
  
    CGFloat locations[3]={0,0.3,1.0};
    
    
    
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, compoents, locations, 3);
    
    CGPoint startCenter = self.center;
    CGFloat startRadius = 0;
    CGPoint endCenter = self.center;
    CGFloat endRadius = 150;
    
    /**
     绘制径向渐变

     @param c#> context description#>
     @param gradient#> 渐变色 description#>
     @param startCenter#> 起始位置 description#>
     @param startRadius#> 起始半径 若不为0,则会发现 此范围内并没有填充，空心
     @param endCenter#> 终点位置 一般都和 起始位置相同，不然会发生偏差
     @param endRadius#> 终点半径 渐变的扩散长度
     @param options#> 绘制方式 description#>
     @return
     */
    CGContextDrawRadialGradient(context, gradient, startCenter, startRadius, endCenter, endRadius, kCGGradientDrawsBeforeStartLocation);
    
    CGColorSpaceRelease(colorSpace);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
