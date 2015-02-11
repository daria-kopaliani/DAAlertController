//
//  DAAlertAction.h
//  DAAlertControllerDemo
//
//  Created by Daria Kopaliani on 2/4/15.
//  Copyright (c) 2015 FactoralComplexity. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DAAlertActionStyle) {
    DAAlertActionStyleDefault = 0,
    DAAlertActionStyleCancel,
    DAAlertActionStyleDestructive
};

@interface DAAlertAction : NSObject <NSCopying>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) DAAlertActionStyle style;
@property (nonatomic, copy) void (^handler)(void);

+ (instancetype)actionWithTitle:(NSString *)title style:(DAAlertActionStyle)style handler:(void (^)(void))handler;

@end
