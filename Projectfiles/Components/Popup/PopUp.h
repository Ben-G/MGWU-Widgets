//
//  PopUp.h
//  _MGWU-SideScroller-Template_
//
//  Created by Benjamin Encz on 5/28/13.
//  Copyright (c) 2013 MakeGamesWithUs Inc. Free to use for all purposes.
//
//

#import "CCNode.h"
#import "MGWUCCControlButton.h"
#import "MGWUCCNinePatchBackgroundNode.h"

#define OK_BUTTON_INDEX -1

/**
 A cocos2D Popup similar to UIAlertView.
 */

@interface PopUp : MGWUCCNinePatchBackgroundNode <CCTouchOneByOneDelegate>

- (void)dismiss;
- (NSString *)textFieldText;

/** 
    Shows a popup on the currently running scene.
    The selector should be implemented this way:
    @code
 - (void)popUpButtonClicked:(int)buttonIndex
 {
    if (buttonIndex == OK_BUTTON_INDEX)
    {
    // OK button selected
    contentLabel.string = [popup textFieldText];
    }
 }
    @endcode
 
 All button indexes will be in the order of the provided buttonTitles.
 */
+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButonTitles target:(id)target selector:(SEL)selector;

/**
 Popup with input field. Value of inputField can be accessed over 'textFieldText' property of the popup */
+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButonTitles target:(id)target selector:(SEL)selector showsInputField:(BOOL)showsInputField;















/** Popup with input field and custom size */
+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButonTitles showsInputField:(BOOL)showsInputField size:(CGSize)size target:(id)target selector:(SEL)selector;

/** Popup with input field, custom size and custom position */
+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButonTitles showsInputField:(BOOL)showsInputField size:(CGSize)size atPosition:(CGPoint)position target:(id)target selector:(SEL)selector;

/**
 PopUp with custom image and custom size
 */
+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButonTitles size:(CGSize)size backgroundImage:(NSString *)backgroundImage target:(id)target selector:(SEL)selector;

/**
 PopUp with custom image and automatic size
 */
+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButonTitles backgroundImage:(NSString *)backgroundImage target:(id)target selector:(SEL)selector;

/**
 PopUp with custom image and automatic size and custom button images
 */
+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButonTitles backgroundImage:(NSString *)backgroundImage buttonImage:(NSString *)buttonImage target:(id)target selector:(SEL)selector;

/**
 PopUp with custom image, custom button image and automatic size
 */
+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButonTitles backgroundImage:(NSString *)backgroundImage buttonImage:(NSString *)buttonImage target:(id)target selector:(SEL)selector showsInputField:(BOOL)showsInputField;

/**
 Fully custom popup.
 */
+ (PopUp *)showWithMessage:(NSString *)message okButtonTitle:(NSString*)okButtonTitle otherButtonTitles:(NSArray*)otherButonTitles showsInputField:(BOOL)showsInputField size:(CGSize)size atPosition:(CGPoint)position backgroundImage:(NSString *)backgroundImage buttonImage:(NSString *)buttonImage target:(id)target selector:(SEL)selector;


@end

// if popup is setup with this size, it will use automatic sizing
#define AUTOSIZING_CONTENT_SIZE CGSizeMake(250, 0)
