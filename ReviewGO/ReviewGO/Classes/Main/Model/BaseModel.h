//
//  BaseModel.h
//  ReviewGO
//
//  Created by wjl on 2017/12/7.
//  Copyright © 2017年 wjl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * className;
@property (nonatomic, assign, getter=isModal) BOOL modal;

- (instancetype)initWithName:(NSString *)name className:(NSString *)className modal:(BOOL)modal;

@end
