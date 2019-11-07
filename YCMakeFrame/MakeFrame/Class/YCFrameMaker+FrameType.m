//
//  YCFrameMaker+FrameType.m
//  YCMakeFrame
//
//  Created by 陈煜钏 on 2019/10/22.
//  Copyright © 2019 陈煜钏. All rights reserved.
//

#import "YCFrameMaker+FrameType.h"

#import <objc/runtime.h>

#define SAVE_AND_RETURN_TYPE(__type)    \
YCFrameMakerType *type = [YCFrameMakerType typeWithView:self.view type:__type];  \
self.typesDictionary[@(__type)] = type; \
return type;    \

#define ADD_TYPE_AND_RETURN_MAKER(__type)   \
YCFrameMakerType *type = [YCFrameMakerType typeWithView:self.view type:__type];  \
self.typesDictionary[@(__type)] = type;     \
[self.yc_withTypesArray addObject:type];    \
return self;    \

@interface YCFrameMaker ()

@property (nonatomic, strong) NSMutableArray<YCFrameMakerType *> *yc_withTypesArray;

@end

@implementation YCFrameMaker (FrameType)

#pragma mark - Type

- (YCFrameMakerType *)left {
    self.typesDictionary[@(YCFrameTypeCenterX)] = nil;
    SAVE_AND_RETURN_TYPE(YCFrameTypeLeft);
}

- (YCFrameMakerType *)right {
    self.typesDictionary[@(YCFrameTypeCenterX)] = nil;
    SAVE_AND_RETURN_TYPE(YCFrameTypeRight);
}

- (YCFrameMakerType *)top {
    self.typesDictionary[@(YCFrameTypeCenterY)] = nil;
    SAVE_AND_RETURN_TYPE(YCFrameTypeTop);
}

- (YCFrameMakerType *)bottom {
    self.typesDictionary[@(YCFrameTypeCenterY)] = nil;
    SAVE_AND_RETURN_TYPE(YCFrameTypeBottom);
}

- (YCFrameMakerType *)center {
    SAVE_AND_RETURN_TYPE(YCFrameTypeCenter);
}

- (YCFrameMakerType *)centerX {
    self.typesDictionary[@(YCFrameTypeLeft)] = nil;
    self.typesDictionary[@(YCFrameTypeRight)] = nil;
    SAVE_AND_RETURN_TYPE(YCFrameTypeCenterX);
}

- (YCFrameMakerType *)centerY {
    self.typesDictionary[@(YCFrameTypeTop)] = nil;
    self.typesDictionary[@(YCFrameTypeBottom)] = nil;
    SAVE_AND_RETURN_TYPE(YCFrameTypeCenterY);
}

- (YCFrameMakerType *)width {
    SAVE_AND_RETURN_TYPE(YCFrameTypeWidth);
}

- (YCFrameMakerType *)height {
    SAVE_AND_RETURN_TYPE(YCFrameTypeHeight);
}

- (YCFrameMakerType *)size {
    SAVE_AND_RETURN_TYPE(YCFrameTypeSize);
}

- (YCFrameMakerType *)edges {
    SAVE_AND_RETURN_TYPE(YCFrameTypeEdges);
}

#pragma mark - With

- (YCFrameMaker *)withLeft {
    ADD_TYPE_AND_RETURN_MAKER(YCFrameTypeLeft);
}

- (YCFrameMaker *)withRight {
    ADD_TYPE_AND_RETURN_MAKER(YCFrameTypeRight);
}

- (YCFrameMaker *)withTop {
    ADD_TYPE_AND_RETURN_MAKER(YCFrameTypeTop);
}

- (YCFrameMaker *)withBottom {
    ADD_TYPE_AND_RETURN_MAKER(YCFrameTypeBottom);
}

- (YCFrameMaker *)withCenter {
    ADD_TYPE_AND_RETURN_MAKER(YCFrameTypeCenter);
}

- (YCFrameMaker *)withCenterX {
    ADD_TYPE_AND_RETURN_MAKER(YCFrameTypeCenterX);
}

- (YCFrameMaker *)withCenterY {
    ADD_TYPE_AND_RETURN_MAKER(YCFrameTypeCenterY);
}

- (YCFrameMaker *)withWidth {
    ADD_TYPE_AND_RETURN_MAKER(YCFrameTypeWidth);
}

- (YCFrameMaker *)withHeight {
    ADD_TYPE_AND_RETURN_MAKER(YCFrameTypeHeight);
}

- (YCFrameMaker *)withSize {
    ADD_TYPE_AND_RETURN_MAKER(YCFrameTypeSize);
}

- (YCFrameMaker *)withEdges {
    ADD_TYPE_AND_RETURN_MAKER(YCFrameTypeEdges);
}

- (void (^)(id))equalTo
{
    __weak YCFrameMaker *weakSelf = self;
    return ^(id value) {
        for (YCFrameMakerType *type in weakSelf.yc_withTypesArray) {
            type.equalTo(value);
        }
        [weakSelf.yc_withTypesArray removeAllObjects];
        weakSelf.yc_withTypesArray = nil;
    };
}

- (void (^)(id))yc_equalTo
{
    return [self equalTo];
}

#pragma mark - Accessor

- (NSMutableArray<YCFrameMakerType *> *)yc_withTypesArray
{
    NSMutableArray *array = objc_getAssociatedObject(self, _cmd);
    if (!array) {
        array = [NSMutableArray array];
        self.yc_withTypesArray = array;
    }
    return array;
}

- (void)setYc_withTypesArray:(NSMutableArray<YCFrameMakerType *> *)yc_withTypesArray
{
    objc_setAssociatedObject(self, @selector(yc_withTypesArray), yc_withTypesArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

#undef SAVE_AND_RETURN_TYPE
#undef ADD_TYPE_AND_RETURN_MAKER
