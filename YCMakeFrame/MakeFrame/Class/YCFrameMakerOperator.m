//
//  YCFrameMakerOperator.m
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/10.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import "YCFrameMakerOperator.h"

@interface YCFrameMakerOperator ()

@property (nonatomic, readwrite, assign) CGFloat yc_offset;

@property (nonatomic, readwrite, assign) CGFloat yc_multipliedBy;

@end

@implementation YCFrameMakerOperator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _yc_multipliedBy = 1.f;
    }
    return self;
}

#pragma mark - Public

- (void (^)(CGFloat))offset
{
    return ^(CGFloat offset) {
        self.yc_offset = offset;
    };
}

- (void (^)(CGFloat))multipliedBy
{
    return ^(CGFloat multipliedBy) {
        self.yc_multipliedBy = multipliedBy;
    };
}

@end
