//
//  YCFrameMakerType.m
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/10.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import "YCFrameMakerType.h"

#import "UIView+YCAddition.h"
#import "UIView+YCFrameProperty.h"

@interface YCFrameMakerType ()

@property (nonatomic, readwrite, weak) UIView *view;

@property (nonatomic, readwrite, assign) YCFrameType type;

@property (nonatomic, strong) YCFrameMakerOperator *makeOperator;

@property (nonatomic, strong) id value;

@property (nonatomic, assign) YCFrameEqualOptions equalOptions;

@end

@implementation YCFrameMakerType

+ (instancetype)typeWithView:(UIView *)view type:(YCFrameType)type
{
    YCFrameMakerType *makerType = [[self alloc] init];
    makerType.view = view;
    makerType.type = type;
    return makerType;
}

- (YCFrameMakerOperator *(^)(id))equalTo
{
    return ^(id value) {
        self.value = value;
        return self.makeOperator;
    };
}

- (YCFrameMakerOperator *(^)(id))yc_equalTo {
    return [self equalTo];
}

- (YCFrameMakerOperator *(^)(id))lessThanOrEqualTo {
    return ^(id value) {
        self.value = value;
        if (self.type == YCFrameTypeWidth) {
            self.equalOptions = YCFrameEqualOptionsLessThanOrEqualToWidth;
        }
        if (self.type == YCFrameTypeRight) {
            self.equalOptions = YCFrameEqualOptionsLessThanOrEqualToRight;
        }
        return self.makeOperator;
    };
}

- (YCFrameMakerOperator *(^)(id))yc_lessThanOrEqualTo {
    return [self lessThanOrEqualTo];
}

- (YCFrameMakerOperator *(^)(id))greaterThanOrEqualTo {
    return ^(id value) {
        self.value = value;
        if (self.type == YCFrameTypeWidth) {
            self.equalOptions = YCFrameEqualOptionsGreaterThanOrEqualToWidth;
        }
        if (self.type == YCFrameTypeHeight) {
            self.equalOptions = YCFrameEqualOptionsGreaterThanOrEqualToHeight;
        }
        return self.makeOperator;
    };
}

- (YCFrameMakerOperator *(^)(id))yc_greaterThanOrEqualTo {
    return [self greaterThanOrEqualTo];
}

- (void (^)(YCFrameCommitResult *))commit
{
    return ^(YCFrameCommitResult *result) {
        UIView *relatedView = nil;
        NSNumber *number = nil;
        NSValue *value = nil;
        YCFrameMakerDirection *direction = nil;
        
        id typeValue = self.value;
        if ([[typeValue class] isSubclassOfClass:[UIView class]]) {
            //满足: 1、父子view关系 或 2、同一个父view
            if (self.view.superview == typeValue || self.view.superview == ((UIView *)typeValue).superview) {
                relatedView = (UIView *)typeValue;
            }
        } else if ([typeValue isKindOfClass:[NSNumber class]]) {
            number = (NSNumber *)typeValue;
        } else if ([typeValue isKindOfClass:[NSValue class]]) {
            value = (NSValue *)typeValue;
        } else if ([typeValue isKindOfClass:[YCFrameMakerDirection class]]) {
            direction = (YCFrameMakerDirection *)typeValue;
        }
        NSAssert(!(!relatedView && !number && !value && !direction), @"Unknown value");
        
        if (relatedView) {
            [relatedView.yc_relatedViewsHashTable addObject:self.view];
        } else if (direction.view) {
            [direction.view.yc_relatedViewsHashTable addObject:self.view];
        }
        
        result.equalOptions |= self.equalOptions;
        
        CGFloat offset = self.makeOperator.yc_offset;
        CGFloat multipliedBy = self.makeOperator.yc_multipliedBy;
        
#define IS_SUPERVIEW                    (self.view.superview == relatedView)
#define IS_THE_SAME_SUPERVIEW           (self.view.superview == relatedView.superview)
        
        switch (self.type) {
            case YCFrameTypeNone : {
                break;
            }
            case YCFrameTypeLeft : {
                CGFloat left = 0;
                if (relatedView) {
                    if (IS_SUPERVIEW) {
                        left = 0;
                    } else if (IS_THE_SAME_SUPERVIEW) {
                        left = relatedView.yc_x;
                    }
                } else if (number) {
                    left = number.floatValue;
                } else if (direction) {
                    left = direction.floatValue;
                }
                result.left = left + offset;
                break;
            }
            case YCFrameTypeRight : {
                CGFloat right = 0;
                if (relatedView) {
                    if (IS_SUPERVIEW) {
                        right = relatedView.yc_width;
                    } else if (IS_THE_SAME_SUPERVIEW) {
                        right = CGRectGetMaxX(relatedView.frame);
                    }
                } else if (number) {
                    right = number.floatValue;
                } else if (direction) {
                    right = direction.floatValue;
                }
                result.right = right - offset;
                break;
            }
            case YCFrameTypeTop : {
                CGFloat top = 0;
                if (relatedView) {
                    if (IS_SUPERVIEW) {
                        top = 0;
                    } else if (IS_THE_SAME_SUPERVIEW) {
                        top = relatedView.yc_y;
                    }
                } else if (number) {
                    top = number.floatValue;
                } else if (direction) {
                    top = direction.floatValue;
                }
                result.top = top + offset;
                break;
            }
            case YCFrameTypeBottom : {
                CGFloat bottom = 0;
                if (relatedView) {
                    if (IS_SUPERVIEW) {
                        bottom = relatedView.yc_height;
                    } else if (IS_THE_SAME_SUPERVIEW) {
                        bottom = CGRectGetMaxY(relatedView.frame);
                    }
                } else if (number) {
                    bottom = number.floatValue;
                } else if (direction) {
                    bottom = direction.floatValue;
                }
                result.bottom = bottom - offset;
                break;
            }
            case YCFrameTypeCenter : {
                CGFloat centerX = 0;
                CGFloat centerY = 0;
                if (relatedView) {
                    if (IS_SUPERVIEW) {
                        centerX = relatedView.yc_width / 2;
                        centerY = relatedView.yc_height / 2;
                    } else if (IS_THE_SAME_SUPERVIEW) {
                        centerX = relatedView.center.x;
                        centerY = relatedView.center.y;
                    }
                } else {
                    CGPoint center = [value CGPointValue];
                    centerX = center.x;
                    centerY = center.y;
                }
                result.centerX = centerX;
                result.centerY = centerY;
                break;
            }
            case YCFrameTypeCenterX : {
                CGFloat centerX = 0;
                if (relatedView) {
                    if (IS_SUPERVIEW) {
                        centerX = relatedView.yc_width / 2;
                    } else if (IS_THE_SAME_SUPERVIEW) {
                        centerX = relatedView.center.x;
                    }
                } else if (number) {
                    centerX = number.floatValue;
                } else if (direction) {
                    centerX = direction.floatValue;
                }
                result.centerX = centerX + offset;
                break;
            }
            case YCFrameTypeCenterY : {
                CGFloat centerY = 0;
                if (relatedView) {
                    if (IS_SUPERVIEW) {
                        centerY = relatedView.yc_height / 2;
                    } else if (IS_THE_SAME_SUPERVIEW) {
                        centerY = relatedView.center.y;
                    }
                } else if (number) {
                    centerY = number.floatValue;
                } else if (direction) {
                    centerY = direction.floatValue;
                }
                result.centerY = centerY + offset;
                break;
            }
            case YCFrameTypeWidth : {
                CGFloat width = 0;
                if (relatedView) {
                    width = relatedView.yc_width;
                } else if (number) {
                    width = number.floatValue;
                }
                result.width = width * multipliedBy;
                break;
            }
            case YCFrameTypeHeight : {
                CGFloat height = 0;
                if (relatedView) {
                    height = relatedView.yc_height;
                } else {
                    height = number.floatValue;
                }
                result.height = height * multipliedBy;
                break;
            }
            case YCFrameTypeSize : {
                CGFloat width = 0;
                CGFloat height = 0;
                if (relatedView) {
                    width = relatedView.yc_width;
                    height = relatedView.yc_height;
                } else {
                    CGSize size = [value CGSizeValue];
                    width = size.width;
                    height = size.height;
                }
                result.width = width;
                result.height = height;
                break;
            }
            case YCFrameTypeEdges : {
                if (relatedView) {
                    result.width = relatedView.yc_width;
                    result.height = relatedView.yc_height;
                }
                break;
            }
        }
        
#undef IS_SUPERVIEW
#undef IS_THE_SAME_SUPERVIEW
        
    };
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"YCMakeFrame Type : %zd Value : %@", self.type, self.value];
}

#pragma mark - Getter

- (YCFrameMakerOperator *)makeOperator
{
    if (!_makeOperator) {
        _makeOperator = [[YCFrameMakerOperator alloc] init];
    }
    return _makeOperator;
}

@end
