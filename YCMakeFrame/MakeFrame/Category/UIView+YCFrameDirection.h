//
//  UIView+YCFrameDirection.h
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/23.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YCFrameMakerDirection.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YCFrameDirection)

@property (nonatomic, strong) YCFrameMakerDirection *yc_left;

@property (nonatomic, strong) YCFrameMakerDirection *yc_right;

@property (nonatomic, strong) YCFrameMakerDirection *yc_top;

@property (nonatomic, strong) YCFrameMakerDirection *yc_bottom;

@end

NS_ASSUME_NONNULL_END
