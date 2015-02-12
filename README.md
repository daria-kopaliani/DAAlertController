# DAAlertController

[![CI Status](http://img.shields.io/travis/Daria Kopaliani/DAAlertController.svg?style=flat)](https://travis-ci.org/Daria Kopaliani/DAAlertController)
[![Version](https://img.shields.io/cocoapods/v/DAAlertController.svg?style=flat)](http://cocoadocs.org/docsets/DAAlertController)
[![License](https://img.shields.io/cocoapods/l/DAAlertController.svg?style=flat)](http://cocoadocs.org/docsets/DAAlertController)
[![Platform](https://img.shields.io/cocoapods/p/DAAlertController.svg?style=flat)](http://cocoadocs.org/docsets/DAAlertController)

If you are a luckier developer and only target iOS 8+ devices, enjoy the new `UIAlertController`, otherwise check `DAAlertController` out, it’s a real timesaver.  
`DAAlertController` provides a convenient block-based interface for configuration and presentation of `UIAlertView`s and `UIActionSheet`s. If `UIAlertContoller` is available `DAAlertController` will just pass all the work to it, otherwise it will use associated references (explained in detail later) to invoke action handlers when buttons are clicked just like `UIAlertController` would.

Naturally, `DAAlertController` is limited to what the old `UIAlertView` and `UIActionSheet` could do:
- action sheets can only have one destructive button (buttons for other destructive actions will be rendered as default buttons)
- alert views cannot have any destructive buttons (again, all buttons will look like default buttons)
- alert views can only have up to 2 text fields
- action sheets can only have a title; a message will not be displayed
- you can only specify up to 10 actions for iOS 7 (otherwise alert views / action sheets would not be rendered properly anyways)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Let’s take a look at the case of a simple alert view:

    DAAlertAction *cancelAction = [DAAlertAction actionWithTitle:@"Cancel"
                                                           style:DAAlertActionStyleCancel handler:nil];
    DAAlertAction *signOutAction = [DAAlertAction actionWithTitle:@"Sign out"
                                                            style:DAAlertActionStyleDestructive handler:^{
                                                                // perform sign out
                                                            }];
    [DAAlertController showAlertViewInViewController:self
                                           withTitle:@"Are you sure you want to sign out?"
                                             message:@"If you sign out of your account all photos will be removed from this iphone."
                                             actions:@[cancelAction, signOutAction]];

Here is what you will get for iOS 8 and 7: (`UIAlertView` does not support destructive buttons so "Sign out" button will be rendered as a default button)

iOS 8+             |  iOS 7
:-------------------------:|:-------------------------:
![](https://github.com/daria-kopaliani/DAAlertController/blob/master/Screenshots/AlertView0iOS8.png)  |  ![](https://github.com/daria-kopaliani/DAAlertController/blob/master/Screenshots/AlertView0iOS7.png)


Presenting an alert view with 2 textfields ("sign up" button should only be enabled when "nickname" is at least 5 letters long) would look like 

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

iOS 8+             |  iOS 7
:-------------------------:|:-------------------------:
![](https://github.com/daria-kopaliani/DAAlertController/blob/master/Screenshots/AlertView1iOS8.png)  |  ![](https://github.com/daria-kopaliani/DAAlertController/blob/master/Screenshots/AlertView1iOS7.png)

Methods for presenting action sheets are quite similar, but they also include parameters for `sourceView` or `barButttonItem` and ` permittedArrowDirections`.

iOS 8+             |  iOS 7
:-------------------------:|:-------------------------:
![](https://github.com/daria-kopaliani/DAAlertController/blob/master/Screenshots/ActionSheet0iOS8.png)  |  ![](https://github.com/daria-kopaliani/DAAlertController/blob/master/Screenshots/ActionSheet0iOS7.png)
![](https://github.com/daria-kopaliani/DAAlertController/blob/master/Screenshots/ActionSheet1iOS8.png)  |  ![](https://github.com/daria-kopaliani/DAAlertController/blob/master/Screenshots/ActionSheet1iOS7.png)

## Installation

DAAlertController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "DAAlertController"

## License

DAAlertController is available under the MIT license. See the LICENSE file for more info.

