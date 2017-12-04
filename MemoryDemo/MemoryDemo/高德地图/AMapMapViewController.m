//
//  AMapMapViewController.m
//  MemoryDemo
//
//  Created by xyl on 2017/12/4.
//  Copyright © 2017年 xyl. All rights reserved.
//

#import "AMapMapViewController.h"
#import "MTCustomAnnotationViewController.h"
#import "MTMoveAnnotationViewController.h"
@interface AMapMapViewController ()

@end

@implementation AMapMapViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
- (IBAction)customAnnotationAction:(UIButton *)sender {
    MTCustomAnnotationViewController *vc = [[MTCustomAnnotationViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (IBAction)moveAnnotationAction:(id)sender {
    
    MTMoveAnnotationViewController *vc = [[MTMoveAnnotationViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
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
