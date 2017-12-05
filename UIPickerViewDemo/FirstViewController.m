//
//  FirstViewController.m
//  UIPickerViewDemo
//
//  Created by Setoge on 2017/12/5.
//  Copyright © 2017年 Bulet. All rights reserved.
//

#import "FirstViewController.h"
#import "ViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"First";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *butto = [UIButton buttonWithType:UIButtonTypeCustom];
    butto.frame = CGRectMake(80, 150, 100, 40);
    butto.backgroundColor = [UIColor blueColor];
    [butto addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butto];
}
- (void)click:(UIButton *)sender
{
    ViewController *vc = [[ViewController alloc] init];
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
