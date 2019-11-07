//
//  UIView+YCFrameDirection.m
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/23.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import "UIView+YCFrameDirection.h"

#import "UIView+YCAddition.h"

@implementation UIView (YCFrameDirection)

#pragma mark - getter

- (YCFrameMakerDirection *)yc_left {
    return [YCFrameMakerDirection directionWithView:self type:YCFrameMakerDirectionTypeLeft];
}

- (YCFrameMakerDirection *)yc_right {
    return [YCFrameMakerDirection directionWithView:self type:YCFrameMakerDirectionTypeRight];
}

- (YCFrameMakerDirection *)yc_top {
    return [YCFrameMakerDirection directionWithView:self type:YCFrameMakerDirectionTypeTop];
}

- (YCFrameMakerDirection *)yc_bottom {
    return [YCFrameMakerDirection directionWithView:self type:YCFrameMakerDirectionTypeBottom];
}

#pragma mark - setter

- (void)setYc_left:(YCFrameMakerDirection *)yc_left {
    self.yc_x = yc_left.floatValue;
}

- (void)setYc_right:(YCFrameMakerDirection *)yc_right {
    CGRect frame = self.frame;
    frame.origin.x = yc_right.floatValue - CGRectGetWidth(self.frame);
    self.frame = frame;
}

- (void)setYc_top:(YCFrameMakerDirection *)yc_top {
    self.yc_y = yc_top.floatValue;
}

- (void)setYc_bottom:(YCFrameMakerDirection *)yc_bottom {
    CGRect frame = self.frame;
    frame.origin.x = yc_bottom.floatValue - CGRectGetHeight(self.frame);
    self.frame = frame;
}

@end
