//
//  UIView+YCMakeFrame.h
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/23.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YCFrameMaker+FrameType.h"
#import "UIView+YCFrameDirection.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^YCMakeFrameBlock)(YCFrameMaker *make);

@interface UIView (YCMakeFrame)

/**
 布局；会缓存makeBlock结果
*/
- (void)yc_makeFrame:(YCMakeFrameBlock)makeBlock;

/**
 更新布局中的某一项
 */
- (void)yc_updateFrame:(YCMakeFrameBlock)makeBlock;

/**
 重新布局；清除缓存的makeBlock结果
 */
- (void)yc_remakeFrame:(YCMakeFrameBlock)makeBlock;

@end

NS_ASSUME_NONNULL_END
