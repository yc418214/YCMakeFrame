//
//  YCFrameMaker.h
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/10.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "YCFrameMakerType.h"

NS_ASSUME_NONNULL_BEGIN

@interface YCFrameMaker : NSObject

@property (nonatomic, readonly, weak) UIView *view;

@property (nonatomic, readonly, strong) NSMutableDictionary<NSNumber *, YCFrameMakerType *> *typesDictionary;

+ (instancetype)makerWithView:(UIView *)view;

- (void)commit;

@end

NS_ASSUME_NONNULL_END
