//
//  ViewController.m
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/10.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import "ViewController.h"

#import "UIView+YCMakeFrame.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.button = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.button setTitle:@"按钮" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button.layer.borderWidth = 1.f;
    self.button.layer.cornerRadius = 4.f;
    [self.button addTarget:self action:@selector(changeLabel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label.layer.borderWidth = 1.f;
    self.label.layer.cornerRadius = 4.f;
    self.label.text = @"哈哈哈哈哈哈";
    [self.view addSubview:self.label];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self.button yc_makeFrame:^(YCFrameMaker * _Nonnull make) {
        make.centerX.equalTo(self.view);
        make.top.yc_equalTo(120);
        make.width.yc_greaterThanOrEqualTo(44);
    }];
    
    [self.label yc_makeFrame:^(YCFrameMaker * _Nonnull make) {
        make.centerX.equalTo(self.button);
        make.top.equalTo(self.button.yc_bottom).offset(12);
        make.width.yc_lessThanOrEqualTo(80);
    }];
}

static NSInteger count = 0;
- (void)changeLabel
{
    if (count == 0) {
        [self.button yc_updateFrame:^(YCFrameMaker * _Nonnull make) {
            make.withWidth.withHeight.yc_equalTo(100);
        }];
    }
    if (count == 1) {
        [self.label yc_updateFrame:^(YCFrameMaker * _Nonnull make) {
            make.height.yc_greaterThanOrEqualTo(40);
            make.width.yc_greaterThanOrEqualTo(120);
        }];
    }
    count++;
}

@end
