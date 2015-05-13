//
//  UIActionSheet+DAAlert.m
//  DAAlertTest
//
//  Created by fritzgerald muiseroux on 13/05/15.
//  Copyright (c) 2015 fritzgerald muiseroux. All rights reserved.
//

#import "UIActionSheet+DAAlert.h"
#import <objc/runtime.h>

@implementation UIActionSheet (DAAlert)

- (DAAlertAction *)daCancelAction
{
    return objc_getAssociatedObject(self, @selector(daCancelAction));
}

- (void)setDaCancelAction:(DAAlertAction *)daCancelAction
{
    objc_setAssociatedObject(self, @selector(daCancelAction), daCancelAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DAAlertAction *)daDestructiveAction
{
    return objc_getAssociatedObject(self, @selector(daDestructiveAction));
}

- (void)setDaDestructiveAction:(DAAlertAction *)daDestructiveAction
{
    objc_setAssociatedObject(self, @selector(daDestructiveAction), daDestructiveAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSArray *)daOtherActions
{
    return objc_getAssociatedObject(self, @selector(daOtherActions));
}

- (void)setDaOtherActions:(NSArray *)daOtherActions
{
    objc_setAssociatedObject(self, @selector(daOtherActions), daOtherActions, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL (^)(NSArray *))daValidationBlock
{
    return objc_getAssociatedObject(self, @selector(daValidationBlock));
}

- (void)setDaValidationBlock:(BOOL (^)(NSArray *))daValidationBlock
{
    objc_setAssociatedObject(self, @selector(daValidationBlock), daValidationBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
