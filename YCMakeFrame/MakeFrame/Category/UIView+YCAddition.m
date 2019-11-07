//
//  UIView+YCAddition.m
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/22.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import "UIView+YCAddition.h"

@implementation UIView (YCAddition)

- (CGFloat)yc_width {
    return self.frame.size.width;
}

- (CGFloat)yc_height {
    return self.frame.size.height;
}

- (CGFloat)yc_x {
    return self.frame.origin.x;
}

- (CGFloat)yc_y {
    return self.frame.origin.y;
}

- (CGFloat)yc_centerX {
    return self.center.x;
}

- (CGFloat)yc_centerY {
    return self.center.y;
}

- (void)setYc_width:(CGFloat)yc_width {
    CGRect frame = self.frame;
    frame.size.width = yc_width;
    self.frame = frame;
}

- (void)setYc_height:(CGFloat)yc_height {
    CGRect frame = self.frame;
    frame.size.height = yc_height;
    self.frame = frame;
}

- (void)setYc_x:(CGFloat)yc_x {
    CGRect frame = self.frame;
    frame.origin.x = yc_x;
    self.frame = frame;
}

- (void)setYc_y:(CGFloat)yc_y {
    CGRect frame = self.frame;
    frame.origin.y = yc_y;
    self.frame = frame;
}

- (void)setYc_centerX:(CGFloat)yc_centerX {
    CGPoint center = self.center;
    center.x = yc_centerX;
    self.center = center;
}

- (void)setYc_centerY:(CGFloat)yc_centerY {
    CGPoint center = self.center;
    center.y = yc_centerY;
    self.center = center;
}

@end
