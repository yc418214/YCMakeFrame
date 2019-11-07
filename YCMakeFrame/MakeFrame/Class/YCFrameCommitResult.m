//
//  YCFrameCommitResult.m
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/22.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import "YCFrameCommitResult.h"

@interface YCFrameCommitResult ()

@property (nonatomic, readwrite, assign) YCFrameCommitOptions commitOptions;

@end

@implementation YCFrameCommitResult

- (void)setLeft:(CGFloat)left
{
    _left = left;
    self.commitOptions |= YCFrameCommitOptionsLeft;
}

- (void)setRight:(CGFloat)right
{
    _right = right;
    self.commitOptions |= YCFrameCommitOptionsRight;
}

- (void)setTop:(CGFloat)top
{
    _top = top;
    self.commitOptions |= YCFrameCommitOptionsTop;
}

- (void)setBottom:(CGFloat)bottom
{
    _bottom = bottom;
    self.commitOptions |= YCFrameCommitOptionsBottom;
}

- (void)setCenterX:(CGFloat)centerX
{
    _centerX = centerX;
    self.commitOptions |= YCFrameCommitOptionsCenterX;
}

- (void)setCenterY:(CGFloat)centerY
{
    _centerY = centerY;
    self.commitOptions |= YCFrameCommitOptionsCenterY;
}

- (void)setWidth:(CGFloat)width
{
    _width = width;
    self.commitOptions |= YCFrameCommitOptionsWidth;
}

- (void)setHeight:(CGFloat)height
{
    _height = height;
    self.commitOptions |= YCFrameCommitOptionsHeight;
}

@end
