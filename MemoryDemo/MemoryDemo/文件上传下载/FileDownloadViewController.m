//
//  FileDownloadViewController.m
//  MemoryDemo
//
//  Created by xyl on 2017/12/5.
//  Copyright © 2017年 xyl. All rights reserved.
//

#import "FileDownloadViewController.h"

@interface FileDownloadViewController ()

@end

@implementation FileDownloadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"下载文件";
    self.view.backgroundColor = [UIColor whiteColor];
    [self connectionMode];
}

-(void)connectionMode
{
    NSString *str = @"http://172.16.90.73/04.jpg";
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *response = nil;
    NSError *error = nil;
    //同步请求数据
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSLog(@"data == %@",data);
    NSLog(@"response == %@",response);
    NSLog(@"error == %@",error);
    
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
