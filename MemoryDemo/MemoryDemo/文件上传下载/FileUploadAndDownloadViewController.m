//
//  FileUploadAndDownloadViewController.m
//  MemoryDemo
//
//  Created by xyl on 2017/12/5.
//  Copyright © 2017年 xyl. All rights reserved.
//

#import "FileUploadAndDownloadViewController.h"
#import "FileDownloadViewController.h"
#import "FileUploadViewController.h"
@interface FileUploadAndDownloadViewController ()

@end

@implementation FileUploadAndDownloadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)fileUploadAction:(UIButton *)sender {
    FileUploadViewController *uploadVC = [[FileUploadViewController alloc]init];
    [self pushToViewController:uploadVC];
    
}
- (IBAction)fileDownloadAction:(UIButton *)sender {
     FileDownloadViewController *downloadVC = [[FileDownloadViewController alloc]init];
    [self pushToViewController:downloadVC];
}

-(void)pushToViewController:(UIViewController *)viewController
{
    [self.navigationController pushViewController:viewController animated:YES];
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
