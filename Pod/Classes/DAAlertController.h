//
//  DAAlertController.h
//  DAAlertControllerDemo
//
//  Created by Daria Kopaliani on 2/4/15.
//  Copyright (c) 2015 FactoralComplexity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAAlertAction.h"


typedef NS_ENUM(NSInteger, DAAlertControllerStyle) {
    DAAlertControllerStyleActionSheet = 0,
    DAAlertControllerStyleAlert
};


@interface DAAlertController : NSObject

+ (void)showAlertOfStyle:(DAAlertControllerStyle)style inViewController:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message actions:(NSArray *)actions;

/// Action Sheets
+ (void)showActionSheetInViewController:(UIViewController *)viewController fromSourceView:(UIView *)sourceView withTitle:(NSString *)title message:(NSString *)message actions:(NSArray *)actions permittedArrowDirections:(UIPopoverArrowDirection)permittedArrowDirections;
+ (void)showActionSheetInViewController:(UIViewController *)viewController fromBarButtonItem:(UIBarButtonItem *)barButtonItem withTitle:(NSString *)title message:(NSString *)message actions:(NSArray *)actions permittedArrowDirections:(UIPopoverArrowDirection)permittedArrowDirections;

/// Alert Views
+ (void)showAlertViewInViewController:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message actions:(NSArray *)actions;
+ (void)showAlertViewInViewController:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message actions:(NSArray *)actions numberOfTextFields:(NSUInteger)numberOfTextFields textFieldsConfigurationHandler:(void (^)(NSArray *textFields))configurationHandler validationBlock:(BOOL (^)(NSArray *textFields))validationBlock;

@end