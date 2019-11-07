//
//  YCFrameMaker.m
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/10.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import "YCFrameMaker.h"

@interface YCFrameMaker ()

@property (nonatomic, readwrite, weak) UIView *view;

@property (nonatomic, readwrite, strong) NSMutableDictionary<NSNumber *, YCFrameMakerType *> *typesDictionary;

@end

@implementation YCFrameMaker

+ (instancetype)makerWithView:(UIView *)view
{
    YCFrameMaker *maker = [[self alloc] init];
    maker.view = view;
    return maker;
}

- (void)commit
{
    CGSize fitSize = [self.view sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    CGFloat fitWidth = fitSize.width;
    CGFloat fitHeight = fitSize.height;
    
    YCFrameCommitResult *result = [[YCFrameCommitResult alloc] init];
    for (YCFrameMakerType *frameType in self.typesDictionary.allValues) {
        frameType.commit(result);
    }
    
    CGFloat left = 0;
    CGFloat top = 0;
    CGFloat width = 0;
    CGFloat height = 0;
    
    YCFrameCommitOptions commitOptions = result.commitOptions;
    YCFrameEqualOptions equalOptions = result.equalOptions;
    
    if (equalOptions & YCFrameEqualOptionsLessThanOrEqualToWidth) {
        //设置了最大宽度
        width = MIN(result.width, fitWidth);
    } else if (equalOptions & YCFrameEqualOptionsGreaterThanOrEqualToWidth) {
        //设置了最小宽度
        width = MAX(result.width, fitWidth);
    } else {
        width = (commitOptions & YCFrameCommitOptionsWidth) ? result.width : fitWidth;
    }
    
    if (equalOptions & YCFrameEqualOptionsGreaterThanOrEqualToHeight) {
        //设置了最小高度
        height = MAX(result.height, fitHeight);
    } else {
        height = (commitOptions & YCFrameCommitOptionsHeight) ? result.height : fitHeight;
    }
    
    if (commitOptions & YCFrameCommitOptionsCenterX) {   //centerX 和 left / right 互斥
        left = result.centerX - width / 2;
    } else {
        if (commitOptions & YCFrameCommitOptionsLeft) {
            left = result.left;
        }
        if (commitOptions & YCFrameCommitOptionsRight) {
            if (commitOptions & YCFrameCommitOptionsLeft) {
                width = result.right - result.left;
                if (equalOptions & YCFrameEqualOptionsLessThanOrEqualToRight) {
                    width = MIN(fitWidth, width);
                }
            } else {
                left = result.right - width;
            }
        }
    }
    
    if (commitOptions & YCFrameCommitOptionsCenterY) {   //centerY 和 top / bottom 互斥
        top = result.centerY - height / 2;
    } else {
        if (commitOptions & YCFrameCommitOptionsTop) {
            top = result.top;
        }
        if (commitOptions & YCFrameCommitOptionsBottom) {
            if (commitOptions & YCFrameCommitOptionsTop) {
                height = result.bottom - result.top;
            } else {
                top = result.bottom - height;
            }
        }
    }
    
    self.view.frame = CGRectMake(ceilf(left), ceilf(top), width, height);
}

#pragma mark - Getter

- (NSMutableDictionary<NSNumber *, YCFrameMakerType *> *)typesDictionary
{
    if (!_typesDictionary) {
        _typesDictionary = [NSMutableDictionary dictionary];
    }
    return _typesDictionary;
}

@end
