//
//  DORootVC.m
//  FlyweightPatternDemo
//
//  Created by 魏欣宇 on 2018/4/8.
//  Copyright © 2018年 Dino. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "DORootVC.h"

#import "DOFlowerFactory.h"
#import "DOFlower.h"

@interface DORootVC ()

@property (nonatomic, strong) UIButton *action_btn;

@property (nonatomic, strong) UIButton *clean_btn;

@property (nonatomic, strong) UITextView *result_textView;

@property (nonatomic, strong) NSMutableArray *result_array;

@property (nonatomic, strong) DOFlowerFactory *flower_factory;

@end

@implementation DORootVC

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"享元模式";
    self.view.backgroundColor = [UIColor redColor];
    
    [self configSubViews];
}

#pragma mark - Custom Cycle
- (void)configSubViews
{
    [self.action_btn addTarget:self action:@selector(clickRunAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.action_btn];
    
    [self.clean_btn addTarget:self action:@selector(clickCleanAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.clean_btn];
    
    [self.view addSubview:self.result_textView];
}

#pragma mark - Event Cycle
- (void)clickRunAction:(UIButton *) action_btn
{
    for (int i = 0; i < 10; i ++)
    {
        FlowerType flower_type = arc4random_uniform(FlowerType_Total);
        
        DOFlower *flower = [self.flower_factory flowerWithType:flower_type];
        
        [self.result_array addObject:flower];
        
        self.result_textView.text = self.result_textView.text == nil ? [self.flower_factory detailsInfor] : [NSString stringWithFormat:@"%@\n%@", self.result_textView.text, [self.flower_factory detailsInfor]];
    }
}

- (void)clickCleanAction:(UIButton *) clean_btn
{
    [self.flower_factory.pools_dict removeAllObjects];
    [self.result_array removeAllObjects];
    self.result_textView.text = nil;
}

#pragma mark - Getter Cycle
- (UIButton *)action_btn
{
    if (!_action_btn)
    {
        _action_btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, (SCREEN_WIDTH - 60) * 0.5, 44)];
        [_action_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_action_btn setTitle:@"运行" forState:UIControlStateNormal];
    }
    return _action_btn;
}

- (UIButton *)clean_btn
{
    if (!_clean_btn)
    {
        _clean_btn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.5 + 10, 100, (SCREEN_WIDTH - 60) * 0.5, 44)];
        [_clean_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_clean_btn setTitle:@"清空" forState:UIControlStateNormal];
    }
    return _clean_btn;
}

- (UITextView *)result_textView
{
    if (!_result_textView)
    {
        _result_textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 180, SCREEN_WIDTH - 40, SCREEN_HEIGHT - 180 - 20)];
        _result_textView.editable = NO;
        _result_textView.selectable = NO;
    }
    return _result_textView;
}

- (NSMutableArray *)result_array
{
    if (!_result_array)
    {
        _result_array = [NSMutableArray array];
    }
    return _result_array;
}

- (DOFlowerFactory *)flower_factory
{
    if (!_flower_factory)
    {
        _flower_factory = [[DOFlowerFactory alloc] init];
    }
    return _flower_factory;
}

@end
