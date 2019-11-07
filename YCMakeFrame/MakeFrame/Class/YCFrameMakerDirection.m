//
//  YCFrameMakerDirection.m
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/10.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import "YCFrameMakerDirection.h"

@interface YCFrameMakerDirection ()

@property (nonatomic, readwrite, weak) UIView *view;

@property (nonatomic, assign) YCFrameMakerDirectionType type;

@end

@implementation YCFrameMakerDirection

+ (instancetype)directionWithView:(UIView *)view type:(YCFrameMakerDirectionType)type
{
    YCFrameMakerDirection *direction = [[self alloc] init];
    direction.view = view;
    direction.type = type;
    return direction;
}

#pragma mark - Getter

- (CGFloat)floatValue
{
    CGFloat floatValue = 0.f;
    switch (self.type) {
        case YCFrameMakerDirectionTypeLeft: {
            floatValue = CGRectGetMinX(self.view.frame);
            break;
        }
        case YCFrameMakerDirectionTypeRight: {
            floatValue = CGRectGetMaxX(self.view.frame);
            break;
        }
        case YCFrameMakerDirectionTypeTop: {
            floatValue = CGRectGetMinY(self.view.frame);
            break;
        }
        case YCFrameMakerDirectionTypeBottom: {
            floatValue = CGRectGetMaxY(self.view.frame);
            break;
        }
    }
    return floatValue;
}

@end
