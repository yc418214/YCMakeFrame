//
//  YCFrameMakerDirection.h
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/10.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YCFrameMakerDirectionType) {
    YCFrameMakerDirectionTypeLeft,
    YCFrameMakerDirectionTypeRight,
    YCFrameMakerDirectionTypeTop,
    YCFrameMakerDirectionTypeBottom
};

NS_ASSUME_NONNULL_BEGIN

@interface YCFrameMakerDirection : NSObject

@property (nonatomic, readonly, weak) UIView *view;

@property (nonatomic, readonly, assign) CGFloat floatValue;

+ (instancetype)directionWithView:(UIView *)view type:(YCFrameMakerDirectionType)type;

@end

NS_ASSUME_NONNULL_END
