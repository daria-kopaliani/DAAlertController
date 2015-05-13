//
//  UIAlertView+DAAlert.h
//  DAAlertTest
//
//  Created by fritzgerald muiseroux on 13/05/15.
//  Copyright (c) 2015 fritzgerald muiseroux. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DAAlertAction;
@interface UIAlertView (DAAlert)

@property (copy, nonatomic) DAAlertAction *daCancelAction;
@property (copy, nonatomic) DAAlertAction *daDestructiveAction;
@property (copy, nonatomic) NSArray *daOtherActions;
@property (copy, nonatomic) BOOL (^daValidationBlock)(NSArray *textFields);

@end
