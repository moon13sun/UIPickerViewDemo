# UIPickerViewDemo

    CGFloat width = 230;
    CGFloat height = 200;
    CGFloat originX = (kScreenSize.width - width)*0.5;
    CGFloat originY = (kScreenSize.height - height)*0.5;
    
    self.pickerView = [[ZGPickerView alloc] initWithFrame:CGRectMake(originX, originY, width, height)];
    self.pickerView.dataArr = [self getData];
    self.pickerView.defaultSelectedRow = @[@(5),@(0),@(10),@(15)];  // 对应着 component：0，1，2，3
    self.pickerView.selectedBackgroudColor = [UIColor yellowColor];
    self.pickerView.selectedTextColor = [UIColor blueColor];
    self.pickerView.normalTextColor = [UIColor redColor];
    self.pickerView.pvDelegate = self;
    [self.view addSubview:self.pickerView];
    [self.pickerView reloadAllComponents];
    
    
    
    
- (NSArray*)getData{
    NSMutableArray* arr = [NSMutableArray new];
    NSMutableArray* agetemp = [NSMutableArray new];
    for (int i = 0; i < 30; i++) {
        [agetemp addObject:[NSString stringWithFormat:@"%d个月",i]];
    }
    for (int i = 4; i <= 100; i++) {
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
    for (int i = 3; i < 190; i++) {
        NSString* str = [NSString stringWithFormat:@"%dkg",i];
        [weighttemp addObject:str];
    }
    [arr addObject:weighttemp];
    return [arr copy];
}
