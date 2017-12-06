//
//  MTCustomAnnotationViewController.m
//  MemoryDemo
//
//  Created by xyl on 2017/12/4.
//  Copyright © 2017年 xyl. All rights reserved.
//

#import "MTCustomAnnotationViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
@interface MTCustomAnnotationViewController ()<MAMapViewDelegate>

@end

@implementation MTCustomAnnotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ///初始化地图
    MAMapView *_mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    
    _mapView.delegate = self;
    ///把地图添加至view
    [self.view addSubview:_mapView];
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
