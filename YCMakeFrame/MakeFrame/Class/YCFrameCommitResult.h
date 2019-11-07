//
//  YCFrameCommitResult.h
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/22.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, YCFrameCommitOptions) {
    YCFrameCommitOptionsNone        = 0,
    YCFrameCommitOptionsLeft        = 1 << 0,
    YCFrameCommitOptionsRight       = 1 << 1,
    YCFrameCommitOptionsTop         = 1 << 2,
    YCFrameCommitOptionsBottom      = 1 << 3,
    YCFrameCommitOptionsCenterX     = 1 << 4,
    YCFrameCommitOptionsCenterY     = 1 << 5,
    YCFrameCommitOptionsWidth       = 1 << 6,
    YCFrameCommitOptionsHeight      = 1 << 7
};

typedef NS_OPTIONS(NSInteger, YCFrameEqualOptions) {
    YCFrameEqualOptionsNone                         = 0,
    YCFrameEqualOptionsLessThanOrEqualToRight       = 1 << 0,
    YCFrameEqualOptionsLessThanOrEqualToWidth       = 1 << 1,
    YCFrameEqualOptionsGreaterThanOrEqualToWidth    = 1 << 2,
    YCFrameEqualOptionsGreaterThanOrEqualToHeight   = 1 << 3
};

NS_ASSUME_NONNULL_BEGIN

@interface YCFrameCommitResult : NSObject

@property (nonatomic, readonly, assign) YCFrameCommitOptions commitOptions;

@property (nonatomic, assign) YCFrameEqualOptions equalOptions;

@property (nonatomic, assign) CGFloat left;

@property (nonatomic, assign) CGFloat right;

@property (nonatomic, assign) CGFloat top;

@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@end

NS_ASSUME_NONNULL_END
