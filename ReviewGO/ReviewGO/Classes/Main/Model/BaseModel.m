//
//  BaseModel.m
//  ReviewGO
//
//  Created by wjl on 2017/12/7.
//  Copyright © 2017年 wjl. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (instancetype)initWithName:(NSString *)name className:(NSString *)className modal:(BOOL)modal
{
    if (self = [super init]) {
        self.name = name;
        self.className = className;
        self.modal = modal;
    }
    return self;
}

@end
