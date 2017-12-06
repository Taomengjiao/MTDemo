//
//  ViewController.m
//  MTDraw
//
//  Created by xyl on 17/3/28.
//  Copyright © 2017年 memoryDemo. All rights reserved.
//

#import "ViewController.h"
#import "MTDrawView.h"
#import "MTDrawForColorView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MTDrawForColorView *drewView = [[MTDrawForColorView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    drewView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:drewView];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
