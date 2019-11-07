//
//  YCFrameMaker+FrameType.h
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/22.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import "YCFrameMaker.h"

#import "YCMakeFrameMacros.h"

NS_ASSUME_NONNULL_BEGIN

#define yc_equalTo(...)                 equalTo(YCFrameBoxValue((__VA_ARGS__)))

@interface YCFrameMaker (FrameType)

- (YCFrameMakerType *)left;
- (YCFrameMakerType *)right;
- (YCFrameMakerType *)top;
- (YCFrameMakerType *)bottom;
- (YCFrameMakerType *)center;
- (YCFrameMakerType *)centerX;
- (YCFrameMakerType *)centerY;
- (YCFrameMakerType *)width;
- (YCFrameMakerType *)height;
- (YCFrameMakerType *)size;
- (YCFrameMakerType *)edges;

- (YCFrameMaker *)withLeft;
- (YCFrameMaker *)withRight;
- (YCFrameMaker *)withTop;
- (YCFrameMaker *)withBottom;
- (YCFrameMaker *)withCenter;
- (YCFrameMaker *)withCenterX;
- (YCFrameMaker *)withCenterY;
- (YCFrameMaker *)withWidth;
- (YCFrameMaker *)withHeight;
- (YCFrameMaker *)withSize;
- (YCFrameMaker *)withEdges;

- (void (^)(id))equalTo;
- (void (^)(id))yc_equalTo;

@end

NS_ASSUME_NONNULL_END
