//
//  UIView+YCMakeFrame.m
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/23.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import "UIView+YCMakeFrame.h"

#import "UIView+YCFrameProperty.h"

@implementation UIView (YCMakeFrame)

- (void)yc_makeFrame:(YCMakeFrameBlock)makeBlock {
    if (!makeBlock) {
        return;
    }
    if (self.yc_frameMaker) {
        [self.yc_frameMaker commit];
        return;
    }
    
    YCFrameMaker *maker = [YCFrameMaker makerWithView:self];
    makeBlock(maker);
    [maker commit];
    self.yc_frameMaker = maker;
}

- (void)yc_updateFrame:(YCMakeFrameBlock)makeBlock {
    if (!makeBlock) {
        return;
    }
    if (!self.yc_frameMaker) {
        return;
    }
    makeBlock(self.yc_frameMaker);
    [self.yc_frameMaker commit];
}

- (void)yc_remakeFrame:(YCMakeFrameBlock)makeBlock {
    self.yc_frameMaker = nil;
    [self yc_makeFrame:makeBlock];
}

@end
