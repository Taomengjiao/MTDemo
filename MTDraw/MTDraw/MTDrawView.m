


//
//  MTDrawView.m
//  MTDraw
//
//  Created by xyl on 17/3/28.
//  Copyright © 2017年 memoryDemo. All rights reserved.
//

#import "MTDrawView.h"

@implementation MTDrawView


//绘制图形，需要在drawRect:中调用
//因为只有在drawRect:方法中才能得到当前图形的上下文
-(void)drawRect:(CGRect)rect
{
//    drawForRect();
//    drawForArc();
//    drawForCircle();
//    drawForImageAndText();
//    drawForTriangle();
    
    //绘制曲线
    drawForBezierCurve();
}
/**
 四边形
 */
void drawForRect()
{
    //获得上下文
    CGContextRef rectContext = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectMake(20, 50, 100, 100);
    //设置四边形
    CGContextAddRect(rectContext, rect);
    //填充颜色
    [[UIColor lightGrayColor]setFill];
    //边框颜色
    [[UIColor redColor]setStroke];
    CGContextDrawPath(rectContext, kCGPathFillStroke);
//    CGContextFillPath(rectContext);
}

/**
 圆弧
 */
void drawForArc()
{
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
    //绘制实心路径
//    CGContextFillPath(arcContext);
}


/**
 圆
 */
void drawForCircle()
{
    CGContextRef circleContext = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectMake(50, 220, 50, 50);
    
    CGContextAddEllipseInRect(circleContext, rect);
    
    [[UIColor purpleColor]setFill];
    
    
    //空心
//    CGContextStrokePath(circleContext);
    
    //实心
    CGContextFillPath(circleContext);
}


/**
 图片
 文字
 */
void drawForImageAndText()
{
    //图片
    UIImage *image = [UIImage imageNamed:@"icon2"];
    
    CGRect rect = CGRectMake(0, 300, 100, 100);
    
    //将图片 平铺在这个区域内，由于图片太大，所以在此区域内只会显示图片的一部分
//    [image drawAsPatternInRect:rect];
    //将图片全部显示在在此区域内，如果大小不合适就会进行拉伸
    [image drawInRect:rect];
    
    //文字
    NSString *string = @"愿你的坚持终成习惯，愿所有旅程都不孤单，愿珍惜可以换得美好。";
    CGRect textRect = CGRectMake(20, 420, 200, 100);

    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    
    [dict setObject:[UIFont systemFontOfSize:15] forKey:NSFontAttributeName];
    [dict setObject:[UIColor redColor] forKey:NSForegroundColorAttributeName];
    
    [string drawInRect:textRect withAttributes:dict];
    
}


/**
 三角形
 */
void drawForTriangle()
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, 20, 500);
    CGContextAddLineToPoint(context, 20, 600);
    CGContextAddLineToPoint(context, 100, 600);

    CGContextClosePath(context);
    
    [[UIColor redColor]setStroke];
    [[UIColor greenColor]setFill];
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
}

/**
 直线
 */
void drawForLine()
{
    //    [super drawRect:rect];
    NSLog(@"绘制图形");
    //1.获得图形的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //2.创建并设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 20, 50);//设置路径的起点（移动到指定位置）
    CGPathAddLineToPoint(path, nil, 50, 200);//绘制直线（从起点位置开始）
    CGPathAddLineToPoint(path, nil, 300, 100);//绘制直线（从上一条直线的位置开始）
    
    CGContextAddLineToPoint(context, 20, 50);
    
    
    
    //3.将路径添加到图形的上下文
    CGContextAddPath(context, path);
    
    //4.设置上下文属性状态
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);//设置笔触的颜色
    CGContextSetRGBFillColor(context, 0, 1, 0, 1);//设置填充的颜色
    CGContextSetLineWidth(context, 2.0f);//设置线条的宽度
    
    //设置线段头尾部样式
    /**
     kCGLineCapButt,//不绘制端点，结尾处直接结束
     kCGLineCapRound,//圆角
     kCGLineCapSquare //方形
     */
    CGContextSetLineCap(context, kCGLineCapRound);//设置顶点样式
    
    //设置线段接合点的样式
    /**
     kCGLineJoinMiter,//尖角
     kCGLineJoinRound,//圆角
     kCGLineJoinBevel//斜角
     */
    CGContextSetLineJoin(context, kCGLineJoinRound);//设置转折点样式
    
    CGFloat lengths[2] = {18,9};
    
    /**
     设置图形上下文样式
     @param c#> context 创建的图形上下文#>
     @param phase#> 虚线开始的位置 description#>
     @param lengths#> 虚线长度间距 description#>
     @param count#> 虚线数组元素个数 description#>
     @return return value description
     */
    CGContextSetLineDash(context, 0, lengths, 2);
    
    
    CGSize offset = CGSizeMake(12, 12);
    CGFloat blur = 0.8f;
    CGColorRef color = [UIColor blueColor].CGColor;
    /**
     设置阴影
     
     @param c#> context description#>
     @param offset#> 偏移量 description#>
     @param blur#> 模糊度 description#>
     @param color#> 阴影颜色 description#>
     @return
     */
    CGContextSetShadowWithColor(context, offset, blur, color);
    
    //5.绘制路径
    
    //填充方式
    /**
     kCGPathFill,//只填充，但不绘制边框
     kCGPathEOFill,//奇偶规则填充（多条路径交叉时，奇数交叉填充，偶数不交叉填充）
     kCGPathStroke,//只绘制边框
     kCGPathFillStroke,//即绘制边框，也会填充
     kCGPathEOFillStroke//奇偶填充，并绘制边框
     */
    CGContextDrawPath(context, kCGPathFill);
    
    
    //6.释放路径
    CGPathRelease(path);
    
    //设置第二个起点
    CGContextMoveToPoint(context, 50, 250);
    //画一条线(线的终点位置)
    CGContextAddLineToPoint(context, 50, 350);
    //设置颜色
    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);
    
    CGContextStrokePath(context);
}


void drawForBezierCurve()
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat x = 20.0f;
    CGFloat y = 50.0f;

    CGContextMoveToPoint(context, x, y);
    
    /**
     二次贝塞尔曲线

     @param c#> context description#>
     @param cpx#> 控制点的X坐标 description#>
     @param cpy#> 控制点的Y description#>
     @param x#> 结束点的X description#>
     @param y#> 结束点的Y description#>
     @return
     */
    CGContextAddQuadCurveToPoint(context, 70, 100, 120, 50);
    
    
    /**
     三次贝塞尔曲线
     
     @param c#> context
     @param cp1x#> 第一个控制点的X坐标
     @param cp1y#> 第一个控制点的Y
     @param cp2x#> 第二个控制点的X description#>
     @param cp2y#> 第二个控制点的Y description#>
     @param x#> 结束点X
     @param y#> 结束点Y
     @return
     */
    CGContextMoveToPoint(context, 50, 400);
    
    CGContextAddCurveToPoint(context, 100, 300, 200, 420, 300, 300);
    
    
    [[UIColor greenColor]setFill];
    [[UIColor redColor]setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
  
    
}


@end
