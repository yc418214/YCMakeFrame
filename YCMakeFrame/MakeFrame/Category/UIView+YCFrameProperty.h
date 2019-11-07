//
//  UIView+YCFrameProperty.h
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/24.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class YCFrameMaker;

@interface UIView (YCFrameProperty)

@property (nonatomic, strong) YCFrameMaker * _Nullable yc_frameMaker;

@property (nonatomic, strong) NSHashTable<UIView *> *yc_relatedViewsHashTable;

@property (nonatomic, assign) BOOL yc_enableAutoLayout;

@end

NS_ASSUME_NONNULL_END
