//
//  YCFrameMakerType.h
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/10.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "YCFrameMakerOperator.h"
#import "YCFrameMakerDirection.h"
#import "YCFrameMakerOperator.h"
#import "YCFrameCommitResult.h"
#import "YCMakeFrameMacros.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YCFrameType) {
    YCFrameTypeNone,
    YCFrameTypeLeft,
    YCFrameTypeRight,
    YCFrameTypeTop,
    YCFrameTypeBottom,
    YCFrameTypeCenter,
    YCFrameTypeCenterX,
    YCFrameTypeCenterY,
    YCFrameTypeWidth,
    YCFrameTypeHeight,
    YCFrameTypeSize,
    YCFrameTypeEdges
};

//static inline id _YCFrameBoxValue(const char *type, ...);

#define yc_equalTo(...)                 equalTo(YCFrameBoxValue((__VA_ARGS__)))
#define yc_lessThanOrEqualTo(...)       lessThanOrEqualTo(YCFrameBoxValue((__VA_ARGS__)))
#define yc_greaterThanOrEqualTo(...)    greaterThanOrEqualTo(YCFrameBoxValue((__VA_ARGS__)))

@interface YCFrameMakerType : NSObject

@property (nonatomic, readonly, weak) UIView *view;

@property (nonatomic, readonly, assign) YCFrameType type;

+ (instancetype)typeWithView:(UIView *)view type:(YCFrameType)type;

- (YCFrameMakerOperator *(^)(id))equalTo;

- (YCFrameMakerOperator *(^)(id))yc_equalTo;

- (YCFrameMakerOperator *(^)(id))lessThanOrEqualTo;

- (YCFrameMakerOperator *(^)(id))yc_lessThanOrEqualTo;

- (YCFrameMakerOperator *(^)(id))greaterThanOrEqualTo;

- (YCFrameMakerOperator *(^)(id))yc_greaterThanOrEqualTo;

- (void (^)(YCFrameCommitResult *))commit;

@end

NS_ASSUME_NONNULL_END
