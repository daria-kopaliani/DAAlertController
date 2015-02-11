//
//  DAAlertAction.m
//  DAAlertControllerDemo
//
//  Created by Daria Kopaliani on 2/4/15.
//  Copyright (c) 2015 FactoralComplexity. All rights reserved.
//

#import "DAAlertAction.h"

@implementation DAAlertAction

+ (instancetype)actionWithTitle:(NSString *)title style:(DAAlertActionStyle)style handler:(void (^)(void))handler {
    
    DAAlertAction *action = [[DAAlertAction alloc] init];
    action.title = title;
    action.style = style;
    action.handler = handler;
    
    return action;
}

- (id)copyWithZone:(NSZone *)zone {
    
    DAAlertAction *anotherAction = [[[self class] allocWithZone:zone] init];
    anotherAction.title = self.title;
    anotherAction.style = self.style;
    anotherAction.handler = self.handler;
    
    return anotherAction;
}

@end