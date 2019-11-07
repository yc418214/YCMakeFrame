//
//  UIView+YCFrameProperty.m
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/24.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import "UIView+YCFrameProperty.h"

#import <objc/runtime.h>
#import "YCFrameMaker.h"

@implementation UIView (YCFrameProperty)

+ (void)load
{
    Class targetClass = [self class];
    SEL originalSEL = @selector(setFrame:);
    SEL swizzledSEL = @selector(yc_setFrame:);
    Method originMethod = class_getInstanceMethod(targetClass, originalSEL);
    Method swizzledMethod = class_getInstanceMethod(targetClass, swizzledSEL);
    if (class_addMethod(targetClass,
                        originalSEL,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(targetClass,
                            swizzledSEL,
                            method_getImplementation(originMethod),
                            method_getTypeEncoding(originMethod));
    } else {
        method_exchangeImplementations(originMethod, swizzledMethod);
    }
}

- (void)yc_setFrame:(CGRect)frame
{
    if (!self.yc_enableAutoLayout || self.yc_relatedViewsHashTable.count == 0) {
        [self yc_setFrame:frame];
        return;
    }
    CGRect previousFrame = self.frame;
    [self yc_setFrame:frame];
    if (!CGRectEqualToRect(previousFrame, frame)) {
        for (UIView *relatedView in self.yc_relatedViewsHashTable) {
            [relatedView.yc_frameMaker commit];
        }
    }
}

#pragma mark - getter

- (YCFrameMaker *)yc_frameMaker {
    return objc_getAssociatedObject(self, _cmd);
}

- (NSHashTable<UIView *> *)yc_relatedViewsHashTable
{
    NSHashTable *hashTable = objc_getAssociatedObject(self, _cmd);
    if (!hashTable) {
        hashTable = [NSHashTable weakObjectsHashTable];
        self.yc_relatedViewsHashTable = hashTable;
    }
    return hashTable;
}

- (BOOL)yc_enableAutoLayout
{
    NSNumber *enable = objc_getAssociatedObject(self, _cmd);
    if (!!enable) {
        return [enable boolValue];
    }
    return YES;
}

#pragma mark - setter

- (void)setYc_frameMaker:(YCFrameMaker *)yc_frameMaker {
    objc_setAssociatedObject(self,
                             @selector(yc_frameMaker),
                             yc_frameMaker,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setYc_relatedViewsHashTable:(NSHashTable<UIView *> *)yc_relatedViewsHashTable
{
    objc_setAssociatedObject(self,
                             @selector(yc_relatedViewsHashTable),
                             yc_relatedViewsHashTable,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setYc_enableAutoLayout:(BOOL)yc_enableAutoLayout
{
    objc_setAssociatedObject(self,
                             @selector(yc_enableAutoLayout),
                             @(yc_enableAutoLayout),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
