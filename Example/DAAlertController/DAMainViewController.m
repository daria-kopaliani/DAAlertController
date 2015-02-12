//
//  DAMainViewController.m
//  DAAlertControllerDemo
//
//  Created by Daria Kopaliani on 2/6/15.
//  Copyright (c) 2015 FactoralComplexity. All rights reserved.
//

#import "DAMainViewController.h"

#import "DAAlertController.h"

typedef NS_ENUM(NSUInteger, DAMainViewControllerAlertType) {
    DAMainViewControllerAlertTypeAlertView,
    DAMainViewControllerAlertTypeActionSheet
};


@interface DAMainViewController ()

@property (assign, nonatomic) DAMainViewControllerAlertType alertType;

@property (weak, nonatomic) IBOutlet UILabel *defaultButtonsLabel;
@property (weak, nonatomic) IBOutlet UILabel *cancelButtonsLabel;
@property (weak, nonatomic) IBOutlet UILabel *destructiveButtonsLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfTextFieldsLabel;
@property (weak, nonatomic) IBOutlet UIStepper *defaultButtonsStepper;
@property (weak, nonatomic) IBOutlet UIStepper *cancelButtonsStepper;
@property (weak, nonatomic) IBOutlet UIStepper *destructiveButtonsStepper;
@property (weak, nonatomic) IBOutlet UIStepper *numberOfTextfieldsStepper;
@property (weak, nonatomic) IBOutlet UIButton *alertTypeButton;
@property (weak, nonatomic) IBOutlet UIButton *showAlertButton;
@property (strong, nonatomic) UIBarButtonItem *navigationBarButtonItem;

@end


@implementation DAMainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Show Action Sheet" style:UIBarButtonItemStylePlain target:self action:@selector(showActionSheetFromBarButtonItem:)];
    self.alertType = DAMainViewControllerAlertTypeAlertView;
    
    self.defaultButtonsStepper.value = 1;
    self.cancelButtonsStepper.value = 1;
    self.destructiveButtonsStepper.value = 2;
    [self updateCancelButtonsLabel];
    [self updateDefaultButtonsLabel];
    [self updateDestructiveButtonsLabel];
}

#pragma mark - IBActions
#pragma mark -

- (IBAction)alertTypeButtonTapped:(id)sender {
    
    DAAlertAction *cancelAction = [DAAlertAction actionWithTitle:@"Cancel" style:DAAlertActionStyleCancel handler:nil];
    DAAlertAction *alertViewAction = [DAAlertAction actionWithTitle:@"Alert View" style:DAAlertActionStyleDefault handler:^{
        self.alertType = DAMainViewControllerAlertTypeAlertView;
    }];
    DAAlertAction *actionSheetAction = [DAAlertAction actionWithTitle:@"Action Sheet" style:DAAlertActionStyleDefault handler:^{
        self.alertType = DAMainViewControllerAlertTypeActionSheet;
    }];
    [DAAlertController showAlertViewInViewController:self withTitle:nil message:@"Select alert type." actions:@[cancelAction, alertViewAction, actionSheetAction]];
}

- (IBAction)cancelButtonsStepperValueChanged:(id)sender {
    
    [self updateCancelButtonsLabel];
}

- (IBAction)defaultButtonsStepperValueChanged:(id)sender {
    
    [self updateDefaultButtonsLabel];
}

- (IBAction)destructiveButtonsStepperValueChanged:(id)sender {
    
    [self updateDestructiveButtonsLabel];
}

- (IBAction)numberOfTextFieldsStepperValueChanged:(id)sender {
    
    [self updateNumberOfTextFieldsLabel];
}

- (void)showActionSheetFromBarButtonItem:(UIBarButtonItem *)barButtonItem {
    
    self.cancelButtonsLabel.hidden = self.cancelButtonsStepper.hidden = self.defaultButtonsLabel.hidden = self.defaultButtonsStepper.hidden = self.destructiveButtonsLabel.hidden = self.destructiveButtonsStepper.hidden = self.numberOfTextFieldsLabel.hidden = self.numberOfTextfieldsStepper.hidden = self.showAlertButton.hidden = YES;

    
    if ([self validateCurrentSettings]) {
        [DAAlertController showActionSheetInViewController:self fromBarButtonItem:barButtonItem withTitle:@"Action Sheet Title" message:@"This is a message." actions:[self currentActions] permittedArrowDirections:UIPopoverArrowDirectionAny];
    }
}

- (IBAction)showAlertView:(id)sender {
    
    self.cancelButtonsLabel.hidden = self.cancelButtonsStepper.hidden = self.defaultButtonsLabel.hidden = self.defaultButtonsStepper.hidden = self.destructiveButtonsLabel.hidden = self.destructiveButtonsStepper.hidden = self.numberOfTextFieldsLabel.hidden = self.numberOfTextfieldsStepper.hidden = self.showAlertButton.hidden = YES;
    
    DAAlertAction *cancelAction = [DAAlertAction actionWithTitle:@"Cancel" style:DAAlertActionStyleCancel handler:nil];
    DAAlertAction *signUpAction = [DAAlertAction actionWithTitle:@"Sign up" style:DAAlertActionStyleDefault handler:^{
        // perform sign up
    }];
    [DAAlertController showAlertViewInViewController:self
                                           withTitle:@"Sign up"
                                             message:@"Please choose a nick name."
                                             actions:@[cancelAction, signUpAction]
                                  numberOfTextFields:2
                      textFieldsConfigurationHandler:^(NSArray *textFields)
    {
        UITextField *nickNameTextField = [textFields firstObject];
        nickNameTextField.placeholder = @"Nick name";
        UITextField *fullNameTextField = [textFields lastObject];
        fullNameTextField.placeholder = @"Full name";
    } validationBlock:^BOOL(NSArray *textFields) {
        UITextField *nickNameTextField = [textFields firstObject];
        return nickNameTextField.text.length >= 5;
    }];
    
    //    if ([self validateCurrentSettings]) {
//        [DAAlertController showAlertViewInViewController:self withTitle:@"Title" message:@"This is a message." actions:[self currentActions] numberOfTextFields:self.numberOfTextfieldsStepper.value textFieldsConfigurationHandler:^void(NSArray *textFields) {
//            [textFields enumerateObjectsUsingBlock:^(UITextField *aTextField, NSUInteger idx, BOOL *stop) {
//                aTextField.placeholder = [NSString stringWithFormat:@"Placeholder %lu", (unsigned long)(idx + 1)];
//            }];
//        } validationBlock:^BOOL(NSArray *textFields) {
//            return [[textFields firstObject] text].length > 3;
//        }];
//    }
}

#pragma mark - Convenience Methods
#pragma mark -

- (NSArray *)currentActions {
    
    DAAlertAction *cancelAction = [DAAlertAction actionWithTitle:@"Cancel" style:DAAlertActionStyleCancel handler:^{
        NSLog(@"\"Cancel\" button tapped");
    }];
    NSMutableArray *defaultActions = [NSMutableArray array];
    for (NSUInteger i = 0; i < self.defaultButtonsStepper.value; i++) {
        NSString *title = nil;
        switch (defaultActions.count) {
            case 0: title = @"Default Action"; break;
            case 1: title = @"Another Default Action"; break;
            case 2: title = @"Yet Another Default Action"; break;
            default: title = [NSString stringWithFormat:@"Default Action %lu", (unsigned long)(i + 1)]; break;
        }
        DAAlertAction *aDefaultAction = [DAAlertAction actionWithTitle:title style:DAAlertActionStyleDefault handler:^{
            NSLog(@"\"%@\" button tapped", title);
        }];
        [defaultActions addObject:aDefaultAction];
    }
    NSMutableArray *destructiveActions = [NSMutableArray array];
    for (NSUInteger i = 0; i < self.destructiveButtonsStepper.value; i++) {
        NSString *title = nil;
        switch (destructiveActions.count) {
            case 0: title = @"Destructive Action"; break;
            case 1: title = @"Another Destructive Action"; break;
            case 2: title = @"Yet Another Destructive Action"; break;
            default: title = [NSString stringWithFormat:@"Destructive Action %lu", (unsigned long)(i + 1)]; break;
        }
        DAAlertAction *aDestructiveAction = [DAAlertAction actionWithTitle:title style:DAAlertActionStyleDestructive handler:^{
            NSLog(@"\"%@\" button tapped", title);
        }];
        [destructiveActions addObject:aDestructiveAction];
    }
    NSMutableArray *actions = [NSMutableArray arrayWithArray:defaultActions];
    [actions addObjectsFromArray:destructiveActions];
    if (cancelAction) {
        [actions addObject:cancelAction];
    }
    
    return actions;
}

- (void)setAlertType:(DAMainViewControllerAlertType)alertType {
    
    switch (alertType) {
        case DAMainViewControllerAlertTypeAlertView: {
            [self.alertTypeButton setTitle:@"Alert View" forState:UIControlStateNormal];
            [self.showAlertButton setTitle:@"Show Alert View" forState:UIControlStateNormal];
            self.numberOfTextFieldsLabel.enabled = self.numberOfTextfieldsStepper.enabled = YES;
            self.numberOfTextfieldsStepper.tintColor = nil;
            self.navigationItem.rightBarButtonItem = nil;
            self.navigationItem.title = @"DAAlertViewController Demo";
        } break;
        case DAMainViewControllerAlertTypeActionSheet: {
            [self.alertTypeButton setTitle:@"Action Sheet" forState:UIControlStateNormal];
            [self.showAlertButton setTitle:@"Show Action Sheet" forState:UIControlStateNormal];
            self.numberOfTextFieldsLabel.enabled = self.numberOfTextfieldsStepper.enabled = NO;
            self.numberOfTextfieldsStepper.tintColor = [UIColor lightGrayColor];
            self.navigationItem.rightBarButtonItem = self.navigationBarButtonItem;
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
                self.navigationItem.title = nil;
            }
        } break;
    }
}

- (BOOL)validateCurrentSettings {
    
    BOOL validSettings = YES;
    if (self.cancelButtonsStepper.value > 1) {
        [DAAlertController showAlertViewInViewController:self withTitle:nil message:@"You can not have more than one cancel button" actions:@[[DAAlertAction actionWithTitle:@"Ok" style:DAAlertActionStyleCancel handler:nil]]];
        validSettings = NO;
    }
    
    if (self.defaultButtonsStepper.value + self.destructiveButtonsStepper.value - 1 > 10) {
        [DAAlertController showAlertViewInViewController:self withTitle:nil message:@"You can not display more than 10 buttons on iOS 7" actions:@[[DAAlertAction actionWithTitle:@"Ok" style:DAAlertActionStyleCancel handler:nil]]];
        validSettings = NO;
    }
    
    return validSettings;
}

- (void)updateCancelButtonsLabel {
    
    self.cancelButtonsLabel.text = [NSString stringWithFormat:@"%lu Cancel Button%@", (unsigned long)self.cancelButtonsStepper.value, (self.cancelButtonsStepper.value != 1) ? @"s" : @""];
}

- (void)updateDefaultButtonsLabel {
    
    self.defaultButtonsLabel.text = [NSString stringWithFormat:@"%lu Default Button%@", (unsigned long)self.defaultButtonsStepper.value, (self.defaultButtonsStepper.value != 1) ? @"s" : @""];
}

- (void)updateDestructiveButtonsLabel {
    
    self.destructiveButtonsLabel.text = [NSString stringWithFormat:@"%lu Destructive Button%@", (unsigned long)self.destructiveButtonsStepper.value, (self.destructiveButtonsStepper.value != 1) ? @"s" : @""];
}

- (void)updateNumberOfTextFieldsLabel {
    
    self.numberOfTextFieldsLabel.text = [NSString stringWithFormat:@"%lu Text Field%@", (unsigned long)self.numberOfTextfieldsStepper.value, (self.numberOfTextfieldsStepper.value != 1) ? @"s" : @""];
}

@end