//
//  PopUp.h
//  _MGWU-SideScroller-Template_
//
//  Created by Benjamin Encz on 5/28/13.
//  Copyright (c) 2013 MakeGamesWithUs Inc. Free to use for all purposes.
//
//

#import "CCNode.h"
#import "CCControlButton.h"
#import "CCNinePatchBackgroundNode.h"

@interface PopUp : CCNinePatchBackgroundNode <CCTouchOneByOneDelegate>

- (void)dismiss;
- (NSString *)textFieldText;

/* analogous to UIAlertViewDelegate, this popup will call the selector on the target. The CCControllButton which is seleced, is passed to the selector as the "sender". The tag of that CCControlButton matches the index of the button title*/
+ (PopUp *)showWithMessage:(NSString *)message buttons:(NSArray*)buttonTitles target:(id)target selector:(SEL)selector;

/* Popup with input field. Value of inputField can be accessed over 'textFieldText' property of the popup */
+ (PopUp *)showWithMessage:(NSString *)message buttons:(NSArray*)buttonTitles target:(id)target selector:(SEL)selector showsInputField:(BOOL)showsInputField;















/* Popup with input field and custom size */
+ (PopUp *)showWithMessage:(NSString *)message buttons:(NSArray*)buttonTitles showsInputField:(BOOL)showsInputField size:(CGSize)size target:(id)target selector:(SEL)selector;

/* Popup with input field, custom size and custom position */
+ (PopUp *)showWithMessage:(NSString *)message buttons:(NSArray*)buttonTitles showsInputField:(BOOL)showsInputField size:(CGSize)size atPosition:(CGPoint)position target:(id)target selector:(SEL)selector;

/*
 PopUp with custom image and custom size
 */
+ (PopUp *)showWithMessage:(NSString *)message buttons:(NSArray*)buttonTitles size:(CGSize)size backgroundImage:(NSString *)backgroundImage target:(id)target selector:(SEL)selector;

/*
 PopUp with custom image and automatic size
 */
+ (PopUp *)showWithMessage:(NSString *)message buttons:(NSArray*)buttonTitles backgroundImage:(NSString *)backgroundImage target:(id)target selector:(SEL)selector;

/*
 PopUp with custom image and automatic size and custom button images
 */
+ (PopUp *)showWithMessage:(NSString *)message buttons:(NSArray*)buttonTitles backgroundImage:(NSString *)backgroundImage buttonImage:(NSString *)buttonImage target:(id)target selector:(SEL)selector;

/*
 PopUp with custom image, custom button image and automatic size
 */
+ (PopUp *)showWithMessage:(NSString *)message buttons:(NSArray*)buttonTitles backgroundImage:(NSString *)backgroundImage buttonImage:(NSString *)buttonImage target:(id)target selector:(SEL)selector showsInputField:(BOOL)showsInputField;

/*
 Fully custom popup.
 */
+ (PopUp *)showWithMessage:(NSString *)message buttons:(NSArray*)buttonTitles showsInputField:(BOOL)showsInputField size:(CGSize)size atPosition:(CGPoint)position backgroundImage:(NSString *)backgroundImage buttonImage:(NSString *)buttonImage target:(id)target selector:(SEL)selector;


@end

// if popup is setup with this size, it will use automatic sizing
#define AUTOSIZING_CONTENT_SIZE CGSizeMake(250, 0)
