//
//  ZGPickerView.m
//  UIPickerViewDemo
//
//  Created by Setoge on 2017/12/5.
//  Copyright © 2017年 Bulet. All rights reserved.
//

#import "ZGPickerView.h"
#define kScreenSize [UIScreen mainScreen].bounds.size
@interface ZGPickerView()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, strong) NSArray* pickerDataSource;
@property (nonatomic,strong) UIColor *iSelectedBackgroudColor;
@property (nonatomic,strong) UIColor *iSelectedTextColor;
@property (nonatomic,strong) UIColor *iNormalTextColor;
@property (nonatomic,strong) NSArray *iDefaultSelectedRow;


@property (nonatomic,strong) NSMutableDictionary *selectedCache;
@property (nonatomic,assign) BOOL hasSetSelectedRow;

@end

@implementation ZGPickerView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initMemberVar];
        [self setup];
    }
    return self;
}

#pragma mark pickerViewDataSource / delegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    if ([self.pickerDataSource.firstObject isKindOfClass:[NSArray class]]) {
        return self.pickerDataSource.count;
    } else {
        return 1;
    }
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if ([self.pickerDataSource.firstObject isKindOfClass:[NSArray class]]) {
        NSArray * arr = self.pickerDataSource[component];
        return arr.count;
    }
    return self.pickerDataSource.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString* str = nil;
    if ([self.pickerDataSource.firstObject isKindOfClass:[NSArray class]]) {
        str = self.pickerDataSource[component][row];
    } else {
        str = self.pickerDataSource[row];
    }
    return str;
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (!self.hasSetSelectedRow && self.iSelectedBackgroudColor) {
        [self customSelectedRow:self.iSelectedBackgroudColor];
    }
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setFont:[UIFont systemFontOfSize:15]];
        NSInteger selected = [(NSNumber *)[self.selectedCache objectForKey:@(component)] integerValue];
        UIColor *color = (selected == row ? (self.iSelectedTextColor ? self.iSelectedTextColor : nil) : (self.iNormalTextColor ? self.iNormalTextColor : nil));
        if (color) {
            [pickerLabel setTextColor:color];
        };
    }
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [self.selectedCache setObject:@(row) forKey:@(component)];
    [self reloadComponent:component];
    if (self.pvDelegate && [self.pvDelegate respondsToSelector:@selector(ZGPickerView:currentComponent:currentRow:)] ) {
        [self.pvDelegate ZGPickerView:pickerView currentComponent:component currentRow:row];
    }
}

#pragma mark -  over ride
- (void)reloadAllComponents{
    [self setupDefaultSelectedRow];
    [super reloadAllComponents];
}
#pragma mark - method
- (void)setupDefaultSelectedRow{
    if (!self.iDefaultSelectedRow) {
        return;
    }
    if (self.iDefaultSelectedRow.count > 1) {
        for (int i = 0; i<self.iDefaultSelectedRow.count; i++) {
            [self selectRow:[(NSNumber *)self.iDefaultSelectedRow[i] integerValue] inComponent:i animated:NO];
            [self.selectedCache setObject:self.iDefaultSelectedRow[i] forKey:@(i)];
        }
    } else if (self.iDefaultSelectedRow.count == 1){
        [self selectRow:[(NSNumber *)self.iDefaultSelectedRow[0] integerValue] inComponent:0 animated:NO];
        [self.selectedCache setObject:self.iDefaultSelectedRow[0] forKey:@(0)];
    } else {
        
    }
}

- (void)setup{
    self.delegate = self;
    self.dataSource = self;
}
- (void)customSelectedRow:(UIColor *)color
{
    NSArray *subviews = self.subviews;
    if (!(subviews.count > 0)) {
        return;
    }
    if (!color) {
        return;
    }
    NSArray *coloms = subviews.firstObject;
    if (coloms) {
        NSArray *subviewCache = [coloms valueForKey:@"subviewCache"];
        if (subviewCache.count > 0) {
            UIView *middleContainerView = [subviewCache.firstObject valueForKey:@"middleContainerView"];
            if (middleContainerView) {
                middleContainerView.backgroundColor = color;
                self.hasSetSelectedRow = YES;
            }
        }
    }
}
- (void)initMemberVar{
    self.selectedCache = [NSMutableDictionary dictionary];
    self.hasSetSelectedRow = NO;
}

#pragma mark - setter
- (void)setSelectedTextColor:(UIColor *)selectedTextColor{
    _iSelectedTextColor = selectedTextColor;
}

- (void)setSelectedBackgroudColor:(UIColor *)selectedBackgroudColor{
    _iSelectedBackgroudColor = selectedBackgroudColor;
}

- (void)setDataArr:(NSArray *)dataArr{
    _pickerDataSource = dataArr;
}

- (void)setDefaultSelectedRow:(NSArray *)defaultSelectedRow{
    _iDefaultSelectedRow = defaultSelectedRow;
}
- (void)setNormalTextColor:(UIColor *)normalTextColor{
    _iNormalTextColor = normalTextColor;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
