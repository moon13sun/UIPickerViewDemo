//
//  ViewController.m
//  UIPickerViewDemo
//
//  Created by Setoge on 2017/12/5.
//  Copyright © 2017年 Bulet. All rights reserved.
//

#import "ViewController.h"
#import "ZGPickerView.h"

#define kScreenSize [UIScreen mainScreen].bounds.size

@interface ViewController ()<ZGPickerViewDelegate>

@property (nonatomic,strong) ZGPickerView *pickerView;
@property (nonatomic, strong) NSMutableArray* pickerDataSource;
@property (nonatomic,strong) NSMutableDictionary *selectedCache;
@property (nonatomic,assign) BOOL hasSetSelectedRow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupPickerView];
//    [self initMemberVar];
//    [self initSelectedCache];
}

#pragma mark - zgpickerview delegate
- (void)ZGPickerView:(ZGPickerView *)pickerView currentComponent:(NSInteger)currentComponent currentRow:(NSInteger)currentRow
{
    NSLog(@"currentRow=%ld,currentComponent%ld",currentRow,currentComponent);
}

#pragma mark - method
- (void)setupPickerView{
    self.title = @"Second";
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat width = 230;
    CGFloat height = 200;
    CGFloat originX = (kScreenSize.width - width)*0.5;
    CGFloat originY = (kScreenSize.height - height)*0.5;
    
    self.pickerView = [[ZGPickerView alloc] initWithFrame:CGRectMake(originX, originY, width, height)];
    self.pickerView.dataArr = /*@[@"aaa",@"bbb",@"ccc",@"hhh",@"ddd",@"eee"];//*/[self getData];
    self.pickerView.defaultSelectedRow = /*@[@(2)];//*/@[@(5),@(0),@(10),@(15)];
//    self.pickerView.selectedBackgroudColor = [UIColor yellowColor];
//    self.pickerView.selectedTextColor = [UIColor blueColor];
//    self.pickerView.normalTextColor = [UIColor redColor];
    self.pickerView.pvDelegate = self;
    [self.view addSubview:self.pickerView];
    [self.pickerView reloadAllComponents];
}




- (NSArray*)getData{
    NSMutableArray* arr = [NSMutableArray new];
    NSMutableArray* agetemp = [NSMutableArray new];
    for (int i = 0; i < 37; i++) {
        [agetemp addObject:[NSString stringWithFormat:@"%d个月",i]];
    }
    for (int i = 4; i <= 120; i++) {
        NSString* str = [NSString stringWithFormat:@"%d岁",i];
        [agetemp addObject:str];
    }
    [arr addObject:agetemp];
    [arr addObject:@[@"男",@"女"]];
    NSMutableArray* talltemp = [NSMutableArray new];
    for (int i = 10; i < 230; i++) {
        NSString* str = [NSString stringWithFormat:@"%dcm",i];
        [talltemp addObject:str];
    }
    [arr addObject:talltemp];
    NSMutableArray* weighttemp = [NSMutableArray new];
    for (int i = 3; i < 200; i++) {
        NSString* str = [NSString stringWithFormat:@"%dkg",i];
        [weighttemp addObject:str];
    }
    [arr addObject:weighttemp];
    return [arr copy];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    NSLog(@"%s",__func__);
}


@end
