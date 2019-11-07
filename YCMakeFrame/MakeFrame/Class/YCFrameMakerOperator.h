//
//  YCFrameMakerOperator.h
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/10.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCFrameMakerOperator : NSObject

@property (nonatomic, readonly, assign) CGFloat yc_offset;

@property (nonatomic, readonly, assign) CGFloat yc_multipliedBy;

- (void (^)(CGFloat))offset;

- (void (^)(CGFloat))multipliedBy;

@end

NS_ASSUME_NONNULL_END
