//
//  ZGPickerView.h
//  UIPickerViewDemo
//
//  Created by Setoge on 2017/12/5.
//  Copyright © 2017年 Bulet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZGPickerView;

@protocol ZGPickerViewDelegate <NSObject>

- (void)ZGPickerView:(ZGPickerView *)pickerView currentComponent:(NSInteger)currentComponent currentRow:(NSInteger)currentRow;

@end


@interface ZGPickerView : UIPickerView

@property (weak, nonatomic) id<ZGPickerViewDelegate> pvDelegate;
@property (nonatomic,strong) NSArray *dataArr;
@property (nonatomic,strong) UIColor *selectedBackgroudColor;
@property (nonatomic,strong) UIColor *selectedTextColor;
@property (nonatomic,strong) UIColor *normalTextColor;
@property (nonatomic,strong) NSArray *defaultSelectedRow;

@end
